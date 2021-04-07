view: attribution_use_case {
  derived_table: {
    sql_trigger_value:  select count(*) from rudder_webapp_data.rudderwebapp.tracks;;
    sql:  WITH
          combined_user_table as (
            select
              context_traits_name as name,
              received_at,
              anonymous_id as id
            from
              eric_db.eric_data.form_submit
            union all
            select
              context_traits_name as name,
              received_at,
              anonymous_id as id
            from
              rudder_autotrack_data.autotrack.form_submit
            union all (
              select
                context_traits_name as name,
                received_at,
                user_id as id
              from
                rudder_webapp_data.rudderwebapp.identifies
              where
                first_login = true
            )
          ),


          session_attributiON AS
          (SELECT *,
           CASE WHEN session_id = LAST_VALUE(session_id)
                                  OVER (partitiON by user_id order by session_start_tstamp ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) THEN 1
                ELSE 0
           END AS LAST_click_attrib_pct,
           CASE WHEN session_id = FIRST_VALUE(session_id)
                                  OVER (partitiON by user_id order by session_start_tstamp ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) THEN 1
                ELSE 0
           END AS first_click_attrib_pct,
           1/count(session_id) OVER (partitiON by user_id) AS even_click_attrib_pct,
           CASE WHEN session_start_tstamp <= timestampadd(day, -7,received_at) THEN 1
                WHEN session_start_tstamp > timestampadd(day, -14,received_at) THEN .5
                WHEN session_start_tstamp > timestampadd(day, -14,received_at) AND session_start_tstamp > timestampadd(day, -21,received_at) THEN .25
                WHEN session_start_tstamp > timestampadd(day, -21,received_at) AND session_start_tstamp > timestampadd(day, -28,received_at) THEN .125
                ELSE 0
           END AS time_decay_attrib_pct
           FROM
               (
               SELECT w.name,
                  s.session_start_tstamp,
                  s.session_end_tstamp,
                  w.received_at,
                  w.id AS user_id,
                  s.session_id,
                  row_number() over
            (partitiON by w.id order by s.session_start_tstamp) AS session_seq,
                  CASE WHEN w.received_at between s.session_start_tstamp and s.session_end_tstamp then true
                        else false
                        end AS conversion_session,
                  CASE WHEN w.received_at < s.session_start_tstamp then true
                           else false
                           end AS prospect_session,
                  coalesce(s.utm_source,'Direct') utm_source,
                  coalesce(s.utm_content,'Direct') utm_content,
                  coalesce(s.utm_medium,'Direct') utm_medium,
                  coalesce(s.utm_campaign,'Direct') utm_campaign,
                  s.first_page_url_path AS entrance_url_path,
                  s.last_page_url_path AS exit_url_path,
                  referrer,
                  duration_in_s,
                  page_views
                FROM eric_db.attribution_use_case.web_sessions__stitched s
                --JOIN rudder_webapp_data.rudderwebapp.users  w
                JOIN combined_user_table w
                ON cast(w.id AS string) = s.blended_user_id
                WHERE w.received_at >= s.session_start_tstamp
                ORDER BY w.id, s.session_start_tstamp)
                ),
         user_transactions AS
            (
              select
                  anonymous_id as user_id,
                  count(*) as total_user_transactions
              from
                  eric_db.eric_data.form_submit
              group by
                  1
              union all
              select
                  anonymous_id as user_id,
                  count(*) as total_user_transactions
              from
                  rudder_autotrack_data.autotrack.form_submit
              group by
                  1
              union all
              select
                  user_id,
                  count(*) as total_user_transactions
              from
                  rudder_webapp_data.rudderwebapp.identifies
              where
                  first_login = true
              group by
                  user_id
            )
    SELECT session_attribution.*,
           total_user_transactions * first_click_attrib_pct AS first_click_attrib_total_transactions,
           total_user_transactions * last_click_attrib_pct AS last_click_attrib_total_transactions,
           total_user_transactions * even_click_attrib_pct AS even_click_attrib_total_transactions,
           total_user_transactions * time_decay_attrib_pct AS time_decay_attrib_total_transactions,
           1 * first_click_attrib_pct AS first_click_attrib_registrations,
           1 * last_click_attrib_pct AS last_click_attrib_registrations,
           1 * even_click_attrib_pct AS even_click_attrib_registrations,
           1 * time_decay_attrib_pct AS time_decay_attrib_registrations
    FROM session_attribution
    JOIN user_transactions
    ON session_attribution.user_id = user_transactions.user_id ;;
  }

  dimension: NAME{
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension_group: SESSION_START_TSTAMP{
    type: time
    timeframes: [date,week,month,quarter,year]
    sql: ${TABLE}.SESSION_START_TSTAMP ;;
  }

  dimension_group: SESSION_END_TSTAMP {
    type: time
    timeframes: [date,week,month,quarter,year]
    sql: ${TABLE}.SESSION_END_TSTAMP ;;

  }

  dimension_group:  RECEIVED_AT{
    type: time
    timeframes: [date,week,month,quarter,year]
    sql: ${TABLE}.RECEIVED_AT ;;

  }

  dimension:  USER_ID {
    type:  string
    sql: ${TABLE}.USER_ID ;;
  }

  dimension:  SESSION_ID {
    type:  string
    sql: ${TABLE}.SESSION_ID ;;
  }

  dimension:  SESSION_SEQ {
    type:  number
    sql: ${TABLE}.SESSION_SEQ ;;
  }

  dimension:  CONVERSION_SESSION {
    type:  string
    sql: ${TABLE}.CONVERSION_SESSION ;;
  }

  dimension:  PROSPECT_SESSION {
    type:  string
    sql: ${TABLE}.PROSPECT_SESSION ;;
  }

  dimension:  UTM_SOURCE {
    type:  string
    sql: ${TABLE}.UTM_SOURCE ;;
  }

  dimension:  UTM_CONTENT {
    type:  string
    sql: ${TABLE}.UTM_CONTENT ;;
  }

  dimension:  UTM_MEDIUM {
    type:  string
    sql: ${TABLE}.UTM_MEDIUM ;;
  }

  dimension:  UTM_CAMPAIGN {
    type:  string
    sql: ${TABLE}.UTM_CAMPAIGN ;;
  }

  dimension:  ENTRANCE_URL_PATH {
    type:  string
    sql: ${TABLE}.ENTRANCE_URL_PATH ;;
  }

  dimension:  EXIT_URL_PATH {
    type:  string
    sql: ${TABLE}.EXIT_URL_PATH ;;
  }

  dimension:  REFERRER {
    type:  string
    sql: ${TABLE}.REFERRER ;;
  }

  dimension:  DURATION_IN_S {
    type:  number
    sql: ${TABLE}.DURATION_IN_S ;;
  }

  dimension:  PAGE_VIEWS {
    type:  number
    sql: ${TABLE}.PAGE_VIEWS ;;
  }

  dimension:  LAST_CLICK_ATTRIB_PCT {
    type:  number
    sql: ${TABLE}.LAST_CLICK_ATTRIB_PCT ;;
  }

  dimension:  FIRST_CLICK_ATTRIB_PCT {
    type:  number
    sql: ${TABLE}.FIRST_CLICK_ATTRIB_PCT ;;
  }

  dimension:  EVEN_CLICK_ATTRIB_PCT {
    type:  number
    sql: ${TABLE}.EVEN_CLICK_ATTRIB_PCT ;;
  }

  dimension:  TIME_DECAY_ATTRIB_PCT {
    type:  number
    sql: ${TABLE}.TIME_DECAY_ATTRIB_PCT ;;
  }

  dimension:  FIRST_CLICK_ATTRIB_TOTAL_TRANSACTIONS {
    type:  number
    sql: ${TABLE}.FIRST_CLICK_ATTRIB_TOTAL_TRANSACTIONS ;;
  }

  dimension:  LAST_CLICK_ATTRIB_TOTAL_TRANSACTIONS {
    type:  number
    sql: ${TABLE}.LAST_CLICK_ATTRIB_TOTAL_TRANSACTIONS ;;
  }

  dimension:  EVEN_CLICK_ATTRIB_TOTAL_TRANSACTIONS {
    type:  number
    sql: ${TABLE}.EVEN_CLICK_ATTRIB_TOTAL_TRANSACTIONS ;;
  }

  dimension:  TIME_DECAY_ATTRIB_TOTAL_TRANSACTIONS {
    type:  number
    sql: ${TABLE}.TIME_DECAY_ATTRIB_TOTAL_TRANSACTIONS ;;
  }

  dimension:  FIRST_CLICK_ATTRIB_REGISTRATIONS {
    type:  number
    sql: ${TABLE}.FIRST_CLICK_ATTRIB_REGISTRATIONS ;;
  }

  dimension:  LAST_CLICK_ATTRIB_REGISTRATIONS {
    type:  number
    sql: ${TABLE}.LAST_CLICK_ATTRIB_REGISTRATIONS ;;
  }

  dimension:  EVEN_CLICK_ATTRIB_REGISTRATIONS {
    type:  number
    sql: ${TABLE}.EVEN_CLICK_ATTRIB_REGISTRATIONS ;;
  }

  dimension:  TIME_DECAY_ATTRIB_REGISTRATIONS {
    type:  number
    sql: ${TABLE}.TIME_DECAY_ATTRIB_REGISTRATIONS ;;
  }

  measure: count {
    type: count
  }


}
