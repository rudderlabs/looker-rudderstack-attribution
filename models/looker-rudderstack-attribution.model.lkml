connection: "rudder-webapp-snowflake"

# include all the views
include: "/views/**/*.view"


datagroup: looker_rudderstack_attribution_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hours"
}

persist_with: looker_rudderstack_attribution_default_datagroup

explore: attribution_use_case {}
