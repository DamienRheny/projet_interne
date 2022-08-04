view: joinv1 {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: Looker_AllData.all_join ;;

  # # Define your dimensions and measures here, like this:
  dimension: query_id {
    description: "Unique ID for each query"
    type: number
    sql: ${TABLE}.Query_ID ;;
  }

  dimension: history_slug{
    description: "Unique ID for each billing"
    type: string
    sql: ${TABLE}.History_Slug;;
  }

  dimension: history_created_time {
    description: "Unique ID for each project"
    type: date_time
    sql: ${TABLE}.History_Created_Time ;;
  }

  dimension: dashboard_id{
    description: "The id of the dashboard"
    type: string
    sql: ${TABLE}.Dashboard_ID__User_defined_only_ ;;
  }

  dimension: dashboard_title{
    description: "The title of the dashboard"
    type: string
    sql: ${TABLE}.Dashboard_Title ;;
  }

  dimension: dashboard_element_id{
    description: "The id of the tile"
    type: number
    sql: ${TABLE}.Dashboard_Element_ID;;
  }

  dimension: dashboard_element_title{
    description: "The title of the tile"
    type: string
    sql: ${TABLE}.Dashboard_Element_Ritle;;
  }

  dimension: project_id {
    description: "Unique GCP ID for each project"
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: total_bytes_billed{
    description: "The total number of bytes for each request"
    type: number
    sql: ${TABLE}.total_bytes_billed ;;
  }


  dimension: user_name{
    description: "The title of the dashboard"
    type: string
    sql: ${TABLE}.User_Name;;
  }

  dimension: month_creation {
    description: "Month of the query"
    type: string
    sql: MONTH(${history_created_time}) ;;

  }
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  measure: count {
    type: count
    drill_fields: []
  }

  measure: price {
    description: "Price of the query"
    type: number
    sql: ${total_bytes_billed}*5*POWER(10,-12) ;;
  }

  measure: sum_of_price {
    description: "Sum of all the query"
    type: sum
    sql: ${total_bytes_billed}*5*POWER(10,-12) ;;
  }


}


# view: joinv1 {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
