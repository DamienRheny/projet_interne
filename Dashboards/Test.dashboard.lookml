- dashboard: interne_page1
  title: interne page1
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: qUReys7H933d6Kcju63gef
  elements:
  - title: Dépenses par utilisateur
    name: Dépenses par utilisateur
    model: sandbox-drheny-interne
    explore: joinv1
    type: looker_bar
    fields: [joinv1.user_name, joinv1.currency]
    sorts: [joinv1.currency desc 0]
    limit: 500
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
    stacking: ''
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
    series_types: {}
    listen:
      Choose the unit of the dashboard, Bytes or Price: joinv1.choiceCurrency
      Choose bytes, megabytes, gigabytes: joinv1.choiceUnit
      History Created Month: joinv1.history_created_month
    row: 1
    col: 4
    width: 8
    height: 6
  - title: Dépenses par dashboard
    name: Dépenses par dashboard
    model: sandbox-drheny-interne
    explore: joinv1
    type: looker_column
    fields: [joinv1.dashboard_title, joinv1.currency]
    limit: 500
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
    stacking: ''
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
    defaults_version: 1
    listen:
      Choose the unit of the dashboard, Bytes or Price: joinv1.choiceCurrency
      Choose bytes, megabytes, gigabytes: joinv1.choiceUnit
      History Created Month: joinv1.history_created_month
    row: 7
    col: 12
    width: 9
    height: 6
  - title: Evolution des dépenses par mois
    name: Evolution des dépenses par mois
    model: sandbox-drheny-interne
    explore: joinv1
    type: looker_column
    fields: [joinv1.history_created_month, joinv1.currency]
    fill_fields: [joinv1.history_created_month]
    sorts: [joinv1.history_created_month desc]
    limit: 500
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
    stacking: ''
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Choose the unit of the dashboard, Bytes or Price: joinv1.choiceCurrency
      Choose bytes, megabytes, gigabytes: joinv1.choiceUnit
      History Created Month: joinv1.history_created_month
    row: 1
    col: 12
    width: 9
    height: 6
  - title: Total dépenses sur Looker
    name: Total dépenses sur Looker
    model: sandbox-drheny-interne
    explore: joinv1
    type: single_value
    fields: [joinv1.currency]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    single_value_title: Total dépenses sur Looker
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Choose the unit of the dashboard, Bytes or Price: joinv1.choiceCurrency
      Choose bytes, megabytes, gigabytes: joinv1.choiceUnit
      History Created Month: joinv1.history_created_month
    row: 1
    col: 0
    width: 4
    height: 6
  - title: Dépenses par folder
    name: Dépenses par folder
    model: sandbox-drheny-interne
    explore: joinv1
    type: looker_column
    fields: [joinv1.folders_name, joinv1.currency]
    sorts: [joinv1.currency desc 0]
    limit: 500
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
    stacking: ''
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
    defaults_version: 1
    listen:
      Choose the unit of the dashboard, Bytes or Price: joinv1.choiceCurrency
      Choose bytes, megabytes, gigabytes: joinv1.choiceUnit
      History Created Month: joinv1.history_created_month
    row: 7
    col: 4
    width: 8
    height: 6
  - type: button
    name: button_461
    rich_content_json: '{"text":"Go to dashboard part","description":"view the dashboard
      of dashboards","newTab":false,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://devoteamgcloud.eu.looker.com/dashboards/108?Dashboard%20Title=&History%20Created%20Time%20Month=1%20month"}'
    row: 0
    col: 0
    width: 4
    height: 1
  - type: button
    name: button_462
    rich_content_json: '{"text":"Go to user part","description":"","newTab":false,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://devoteamgcloud.eu.looker.com/dashboards/106?User+Name=&History+Created+Time+Month=12+month"}'
    row: 0
    col: 4
    width: 10
    height: 1
  filters:
  - name: History Created Month
    title: History Created Month
    type: field_filter
    default_value: 5 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: sandbox-drheny-interne
    explore: joinv1
    listens_to_filters: []
    field: joinv1.history_created_month
  - name: Choose the unit of the dashboard, Bytes or Price
    title: Choose the unit of the dashboard, Bytes or Price
    type: field_filter
    default_value: P
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: sandbox-drheny-interne
    explore: joinv1
    listens_to_filters: []
    field: joinv1.choiceCurrency
  - name: Choose bytes, megabytes, gigabytes
    title: Choose bytes, megabytes, gigabytes
    type: field_filter
    default_value: euro
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: sandbox-drheny-interne
    explore: joinv1
    listens_to_filters: []
    field: joinv1.choiceUnit
