view: all_join {
  sql_table_name: `@{bq_project}.@{bq_dataset}.all_join`
    ;;

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month,
      month_name,
      day_of_week,
      day_of_year,
      day_of_week_index
    ]
    sql: ${TABLE}.creation_time ;;
  }

  dimension: dashboard_element_id {
    type: number
    sql: ${TABLE}.Dashboard_Element_ID ;;
  }

  dimension: dashboard_element_title {
    type: string
    sql: ${TABLE}.Dashboard_Element_Title ;;
  }

  dimension: dashboard_id__user_defined_only_ {
    type: number
    value_format_name: id
    sql: ${TABLE}.Dashboard_ID__User_defined_only_ ;;
  }

  dimension: dashboard_title {
    type: string
    sql: ${TABLE}.Dashboard_Title ;;
  }

  dimension: folders_id {
    type: number
    sql: ${TABLE}.Folders_ID ;;
  }

  dimension: folders_name {
    type: string
    sql: ${TABLE}.Folders_Name ;;
  }

  dimension_group: history_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month,
      month_name,
      month_num,
      day_of_week,
      day_of_year,
      day_of_week_index,
      week_of_year
    ]
    sql: ${TABLE}.History_Created_Time ;;
    drill_fields: [history_created_month_name,history_created_year,history_created_week]
  }

  dimension: history_slug {
    type: string
    sql: ${TABLE}.History_Slug ;;
  }

  dimension: labels_value {
    type: string
    sql: ${TABLE}.labels_value ;;
  }

  dimension: look_id {
    type: number
    sql: ${TABLE}.Look_ID ;;
  }

  dimension: look_title {
    type: number
    sql: ${TABLE}.Look_Title ;;
  }

  dimension: model_set_id {
    type: number
    sql: ${TABLE}.Model_Set_ID ;;
  }

  dimension: model_set_name {
    type: string
    sql: ${TABLE}.Model_Set_Name ;;
  }

  dimension: permission_set_id {
    type: number
    sql: ${TABLE}.Permission_Set_ID ;;
  }

  dimension: permission_set_name {
    type: string
    sql: ${TABLE}.Permission_Set_Name ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_id {
    type: number
    sql: ${TABLE}.Query_ID ;;
  }

  dimension: total_bytes_billed {
    type: number
    sql: ${TABLE}.total_bytes_billed ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.User_Email ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.User_ID ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.User_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_name, folders_name, model_set_name, permission_set_name,dashboard_title, history_created_time]
  }
}
