- dashboard: attribution_use_case
  title: Attribution Use Case
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Registration Weekwise Attributed Transaction Value by UTM Source
    name: Registration Weekwise Attributed Transaction Value by UTM Source
    model: growth_programming
    explore: attribution_use_case
    type: looker_column
    fields: [attribution_use_case.RECEIVED_AT_week, attribution_use_case.UTM_SOURCE,
      event_click_attrib_total_transactions_calculated]
    pivots: [attribution_use_case.UTM_SOURCE]
    fill_fields: [attribution_use_case.RECEIVED_AT_week]
    sorts: [attribution_use_case.RECEIVED_AT_week desc, attribution_use_case.UTM_SOURCE]
    limit: 500
    dynamic_fields: [{measure: event_click_attrib_total_transactions_calculated, based_on: attribution_use_case.EVEN_CLICK_ATTRIB_TOTAL_TRANSACTIONS,
        type: sum, label: Event Click Attrib Total Transactions Calculated, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Attributed Transaction Value, orientation: left, series: [{axisId: autopilot
              - event_click_attrib_total_transactions_calculated, id: autopilot -
              event_click_attrib_total_transactions_calculated, name: autopilot},
          {axisId: data_eng_podcast - event_click_attrib_total_transactions_calculated,
            id: data_eng_podcast - event_click_attrib_total_transactions_calculated,
            name: data_eng_podcast}, {axisId: Direct - event_click_attrib_total_transactions_calculated,
            id: Direct - event_click_attrib_total_transactions_calculated, name: Direct},
          {axisId: email - event_click_attrib_total_transactions_calculated, id: email
              - event_click_attrib_total_transactions_calculated, name: email}, {
            axisId: facebook - event_click_attrib_total_transactions_calculated, id: facebook
              - event_click_attrib_total_transactions_calculated, name: facebook},
          {axisId: github - event_click_attrib_total_transactions_calculated, id: github
              - event_click_attrib_total_transactions_calculated, name: github}, {
            axisId: google - event_click_attrib_total_transactions_calculated, id: google
              - event_click_attrib_total_transactions_calculated, name: google}, {
            axisId: linkedin - event_click_attrib_total_transactions_calculated, id: linkedin
              - event_click_attrib_total_transactions_calculated, name: linkedin},
          {axisId: thenewstack - event_click_attrib_total_transactions_calculated,
            id: thenewstack - event_click_attrib_total_transactions_calculated, name: thenewstack},
          {axisId: virtualintelligence - event_click_attrib_total_transactions_calculated,
            id: virtualintelligence - event_click_attrib_total_transactions_calculated,
            name: virtualintelligence}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Registration Week
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Registration Weekwise Attributed Transaction Value by UTM Campaign
    name: Registration Weekwise Attributed Transaction Value by UTM Campaign
    model: growth_programming
    explore: attribution_use_case
    type: looker_column
    fields: [attribution_use_case.RECEIVED_AT_week, event_click_attrib_total_transactions_calculated,
      attribution_use_case.UTM_CAMPAIGN]
    pivots: [attribution_use_case.UTM_CAMPAIGN]
    fill_fields: [attribution_use_case.RECEIVED_AT_week]
    sorts: [attribution_use_case.RECEIVED_AT_week desc, attribution_use_case.UTM_CAMPAIGN]
    limit: 500
    dynamic_fields: [{measure: event_click_attrib_total_transactions_calculated, based_on: attribution_use_case.EVEN_CLICK_ATTRIB_TOTAL_TRANSACTIONS,
        type: sum, label: Event Click Attrib Total Transactions Calculated, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Attributed Transaction Value, orientation: left, series: [{axisId: CMPGN_1_WR
              - event_click_attrib_total_transactions_calculated, id: CMPGN_1_WR -
              event_click_attrib_total_transactions_calculated, name: CMPGN_1_WR},
          {axisId: CMPGN_13_WCaaslt - event_click_attrib_total_transactions_calculated,
            id: CMPGN_13_WCaaslt - event_click_attrib_total_transactions_calculated,
            name: CMPGN_13_WCaaslt}, {axisId: CMPGN_14_bk - event_click_attrib_total_transactions_calculated,
            id: CMPGN_14_bk - event_click_attrib_total_transactions_calculated, name: CMPGN_14_bk},
          {axisId: CMPGN_15_AE - event_click_attrib_total_transactions_calculated,
            id: CMPGN_15_AE - event_click_attrib_total_transactions_calculated, name: CMPGN_15_AE},
          {axisId: CMPGN_2_GSC - event_click_attrib_total_transactions_calculated,
            id: CMPGN_2_GSC - event_click_attrib_total_transactions_calculated, name: CMPGN_2_GSC},
          {axisId: CMPGN_3_PS - event_click_attrib_total_transactions_calculated,
            id: CMPGN_3_PS - event_click_attrib_total_transactions_calculated, name: CMPGN_3_PS},
          {axisId: CMPGN_5_SA - event_click_attrib_total_transactions_calculated,
            id: CMPGN_5_SA - event_click_attrib_total_transactions_calculated, name: CMPGN_5_SA},
          {axisId: CMPGN_6_FwR - event_click_attrib_total_transactions_calculated,
            id: CMPGN_6_FwR - event_click_attrib_total_transactions_calculated, name: CMPGN_6_FwR},
          {axisId: CMPGN_7_FPDEL - event_click_attrib_total_transactions_calculated,
            id: CMPGN_7_FPDEL - event_click_attrib_total_transactions_calculated,
            name: CMPGN_7_FPDEL}, {axisId: CMPGN_8_OSC - event_click_attrib_total_transactions_calculated,
            id: CMPGN_8_OSC - event_click_attrib_total_transactions_calculated, name: CMPGN_8_OSC},
          {axisId: CMPGN_9_FCWRLFT - event_click_attrib_total_transactions_calculated,
            id: CMPGN_9_FCWRLFT - event_click_attrib_total_transactions_calculated,
            name: CMPGN_9_FCWRLFT}, {axisId: Direct - event_click_attrib_total_transactions_calculated,
            id: Direct - event_click_attrib_total_transactions_calculated, name: Direct},
          {axisId: hosted - event_click_attrib_total_transactions_calculated, id: hosted
              - event_click_attrib_total_transactions_calculated, name: hosted}, {
            axisId: icom - event_click_attrib_total_transactions_calculated, id: icom
              - event_click_attrib_total_transactions_calculated, name: icom}, {axisId: Monthly
              Newsletter - February 2021 - event_click_attrib_total_transactions_calculated,
            id: Monthly Newsletter - February 2021 - event_click_attrib_total_transactions_calculated,
            name: Monthly Newsletter - February 2021}, {axisId: platform - event_click_attrib_total_transactions_calculated,
            id: platform - event_click_attrib_total_transactions_calculated, name: platform},
          {axisId: selfhosted - event_click_attrib_total_transactions_calculated,
            id: selfhosted - event_click_attrib_total_transactions_calculated, name: selfhosted},
          {axisId: 'Weekly Blog Roundup - December 11th, 2020 - event_click_attrib_total_transactions_calculated',
            id: 'Weekly Blog Roundup - December 11th, 2020 - event_click_attrib_total_transactions_calculated',
            name: 'Weekly Blog Roundup - December 11th, 2020'}, {axisId: 'Weekly Blog
              Roundup - January 1st, 2021 - event_click_attrib_total_transactions_calculated',
            id: 'Weekly Blog Roundup - January 1st, 2021 - event_click_attrib_total_transactions_calculated',
            name: 'Weekly Blog Roundup - January 1st, 2021'}, {axisId: 'Weekly Blog
              Roundup - November 20th, 2020 - event_click_attrib_total_transactions_calculated',
            id: 'Weekly Blog Roundup - November 20th, 2020 - event_click_attrib_total_transactions_calculated',
            name: 'Weekly Blog Roundup - November 20th, 2020'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Registration Week
    hidden_series: []
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 6
    col: 0
    width: 24
    height: 7
  - title: Registration Weekwise Attributed Transaction Value by UTM Medium
    name: Registration Weekwise Attributed Transaction Value by UTM Medium
    model: growth_programming
    explore: attribution_use_case
    type: looker_column
    fields: [attribution_use_case.RECEIVED_AT_week, event_click_attrib_total_transactions_calculated,
      attribution_use_case.UTM_MEDIUM]
    pivots: [attribution_use_case.UTM_MEDIUM]
    fill_fields: [attribution_use_case.RECEIVED_AT_week]
    sorts: [attribution_use_case.RECEIVED_AT_week desc, attribution_use_case.UTM_MEDIUM]
    limit: 500
    dynamic_fields: [{measure: event_click_attrib_total_transactions_calculated, based_on: attribution_use_case.EVEN_CLICK_ATTRIB_TOTAL_TRANSACTIONS,
        type: sum, label: Event Click Attrib Total Transactions Calculated, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Attributed Transaction Value, orientation: left, series: [{axisId: blendo
              - event_click_attrib_total_transactions_calculated, id: blendo - event_click_attrib_total_transactions_calculated,
            name: blendo}, {axisId: Direct - event_click_attrib_total_transactions_calculated,
            id: Direct - event_click_attrib_total_transactions_calculated, name: Direct},
          {axisId: email - event_click_attrib_total_transactions_calculated, id: email
              - event_click_attrib_total_transactions_calculated, name: email}, {
            axisId: paidsocial - event_click_attrib_total_transactions_calculated,
            id: paidsocial - event_click_attrib_total_transactions_calculated, name: paidsocial},
          {axisId: podcast - event_click_attrib_total_transactions_calculated, id: podcast
              - event_click_attrib_total_transactions_calculated, name: podcast},
          {axisId: ppc - event_click_attrib_total_transactions_calculated, id: ppc
              - event_click_attrib_total_transactions_calculated, name: ppc}, {axisId: rdr-srv
              - event_click_attrib_total_transactions_calculated, id: rdr-srv - event_click_attrib_total_transactions_calculated,
            name: rdr-srv}, {axisId: social - event_click_attrib_total_transactions_calculated,
            id: social - event_click_attrib_total_transactions_calculated, name: social},
          {axisId: website - event_click_attrib_total_transactions_calculated, id: website
              - event_click_attrib_total_transactions_calculated, name: website}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Registration Week
    hidden_series: []
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 13
    col: 0
    width: 24
    height: 8
  - title: Time Decay Registrations by UTM Source
    name: Time Decay Registrations by UTM Source
    model: growth_programming
    explore: attribution_use_case
    type: looker_pie
    fields: [attribution_use_case.UTM_SOURCE, total_time_decay_attrib_registrations]
    sorts: [total_time_decay_attrib_registrations desc]
    limit: 500
    dynamic_fields: [{measure: total_time_decay_attrib_registrations, based_on: attribution_use_case.TIME_DECAY_ATTRIB_REGISTRATIONS,
        type: sum, label: Total Time Decay Attrib Registrations, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 21
    col: 0
    width: 8
    height: 6
  - title: Time Decay Regsitrations by UTM Campaign
    name: Time Decay Regsitrations by UTM Campaign
    model: growth_programming
    explore: attribution_use_case
    type: looker_pie
    fields: [total_time_decay_attrib_registrations, attribution_use_case.UTM_CAMPAIGN]
    filters: {}
    sorts: [total_time_decay_attrib_registrations desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: total_time_decay_attrib_registrations, based_on: attribution_use_case.TIME_DECAY_ATTRIB_REGISTRATIONS,
        type: sum, label: Total Time Decay Attrib Registrations, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 21
    col: 8
    width: 8
    height: 6
  - title: Time Decay Regsitrations by UTM Medium
    name: Time Decay Regsitrations by UTM Medium
    model: growth_programming
    explore: attribution_use_case
    type: looker_pie
    fields: [total_time_decay_attrib_registrations, attribution_use_case.UTM_MEDIUM]
    filters: {}
    sorts: [total_time_decay_attrib_registrations desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: total_time_decay_attrib_registrations, based_on: attribution_use_case.TIME_DECAY_ATTRIB_REGISTRATIONS,
        type: sum, label: Total Time Decay Attrib Registrations, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Received At Week: attribution_use_case.RECEIVED_AT_week
    row: 21
    col: 16
    width: 8
    height: 6
  filters:
  - name: Received At Week
    title: Received At Week
    type: field_filter
    default_value: 3 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: growth_programming
    explore: attribution_use_case
    listens_to_filters: []
    field: attribution_use_case.RECEIVED_AT_week
