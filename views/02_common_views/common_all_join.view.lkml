include: "/views/01_based_views/all_join.view.lkml"
include: "/views/01_based_views/mapping_unite.view.lkml"
view: +all_join{


  parameter: choiceCurrency {
    type: unquoted
    view_label: "Unit"
    label: "Choose the unit of the dashboard, Bytes or Price"
    suggest_dimension: unite
    suggestable: yes
    full_suggestions: yes
    bypass_suggest_restrictions: yes
#    allowed_value: {
#      value: "B"
#      label: "Bytes"
#    }
#    allowed_value: {
#      value: "P"
#      label: "Price"
#    }
    default_value: "P"
  }

  dimension: unite {
    type: string
    sql: SELECT string_field_0 FROM `sandbox-drheny.Looker_AllData.mapping_unite` LIMIT 1000 ;;
  }

  dimension: valeur {
    type: string
    sql: SELECT string_field_2 FROM `sandbox-drheny.Looker_AllData.mapping_unite` LIMIT 1000 ;;
  }
  parameter: choiceUnit{
    type: unquoted
    view_label: "Unit"
    label: "Choose euro, dollars, bytes, megabytes, gigabytes"
    suggest_dimension:  valeur
    suggestable: yes
    full_suggestions: yes
    bypass_suggest_restrictions: yes
    default_value: "bytes"
#    allowed_value: {
#      value: "euro"
#      label: "Euro"
#    }
#    allowed_value: {
#      value: "dollar"
#      label: "Dollar"
#    }
#    allowed_value: {
#      value: "bytes"
#      label: "Bytes"
#    }
#    allowed_value: {
#      value: "megabytes"
#      label: "Megabytes"
#    }
#    allowed_value: {
#      value: "gigabytes"
#      label: "Gigabytes"
#    }
#    default_value: "euro"
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
  measure: sum_of_bytes{
    description: "Sum of bytes billed"
    type: sum
    sql:  ${total_bytes_billed} ;;
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

  measure: rank {
    description: "Rank"
    type: number
    sql: RANK() OVER (ORDER BY ${sum_of_price} DESC) ;;
  }

  measure: currency {
    description: "choose right measure"
    type: number
    sql:{% if choiceCurrency._parameter_value == "P" %}
  ${sum_of_price}
{% else %}
${sum_of_bytes}
{% endif %};;

    drill_fields: [drilling*]
    link: {
      label: "Details of the cosumption pivot on user_name by unit"
      url: "{{ link }}"
    }
  }


  measure: unit {
    description: "Choose euro, dollar, bytes, megabytes, gigabytes"
    type: number
    sql: {% if choiceUnit._parameter_value == "bytes" %}
      ${sum_of_bytes}
    {% elsif choiceUnit._parameter_value == "megabytes" %}
      ${sum_of_bytes}*POWER(10,-6)
    {% elsif choiceUnit._parameter_value == "gigabytes" %}
      ${sum_of_bytes}*POWER(10,-9)
    {% elsif choiceUnit._parameter_value == "dollar" %}
      ${sum_of_price}
    {% elsif choiceUnit._parameter_value == "euro" %}
      ${sum_of_price}
    {% else %}
      ${sum_of_price}
  {% endif %} ;;


  }

  measure: value {
    description: "Cost of the request"
    type:  number
    sql: ${unit} ;;
    drill_fields: [drilling*]
    link: {
      label: "Details of the cosumption pivot on user_name by unit"
      url: "{{ link }}&pivots=dashboard_title&sort=unit+desc&limit=20"
    }
  }

  set: drilling {

    fields: [user_name,dashboard_title,permission_set_name, unit,currency]
  }

  parameter: choose_rows {
    label: "Choose Grouping (Rows)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Month"
    allowed_value: {label: "Month Name" value:"Month"}
    allowed_value: {label: "Day of Year" value: "DOY"}
    allowed_value: {label: "Day of Month" value: "DOM"}
    allowed_value: {label: "Day of Week" value: "DOW"}
    allowed_value: {value: "Date"}

  }


  parameter: choose_comparison {
    label: "Choose Comparison (Pivot)"
    view_label: "_PoP"
    type: unquoted
    default_value: "Year"
    allowed_value: {value: "Year" }
    allowed_value: {value: "Month"}
    allowed_value: {value: "Week"}
  }

  dimension: pop_row  {
    view_label: "_PoP"
    label_from_parameter: choose_rows
    type: string
    hidden: yes
    #order_by_field: sort_Pop_Row # Important
    sql:
        {% if choose_rows._parameter_value == 'Month' %} ${history_created_month}
        {% elsif choose_rows._parameter_value == 'DOY' %} ${history_created_day_of_year}
        {% elsif choose_rows._parameter_value == 'DOM' %} ${history_created_day_of_month}
        {% elsif choose_rows._parameter_value == 'DOW' %} ${history_created_day_of_week}
        {% elsif choose_rows._parameter_value == 'Date' %} ${history_created_date}
        {% else %}NULL{% endif %} ;;
  }

  dimension: pop_pivot {
    view_label: "_PoP"
    label_from_parameter: choose_comparison
    type: string
    #order_by_field: sort_hack2 # Important
    sql:
        {% if choose_comparison._parameter_value == 'Year' %} ${history_created_year}
        {% elsif choose_comparison._parameter_value == 'Month' %} ${history_created_month_name}
        {% elsif choose_comparison._parameter_value == 'Week' %} ${history_created_week}
        {% else %}NULL{% endif %} ;;
  }

  dimension: sort_Pop_Row {
    view_label: "_PoP"
    type: number
    sql:
        {% if choose_rows._parameter_value == 'Month' %} ${history_created_month_name}
        {% elsif choose_rows._parameter_value == 'DOY' %} ${history_created_day_of_year}
        {% elsif choose_rows._parameter_value == 'DOM' %} ${history_created_day_of_month}
        {% elsif choose_rows._parameter_value == 'DOW' %} ${history_created_day_of_week_index}
        {% elsif choose_rows._parameter_value == 'Date' %} ${history_created_date}
        {% else %}NULL{% endif %} ;;
  }

  dimension: sort_Pop_Pivot {
    view_label: "_PoP"
    hidden: yes
    type: string
    sql:
        {% if choose_comparison._parameter_value == 'Year' %} ${history_created_year}
        {% elsif choose_comparison._parameter_value == 'Month' %} ${history_created_month_num}
        {% elsif choose_comparison._parameter_value == 'Week' %} ${history_created_week}
        {% else %}NULL{% endif %} ;;
  }



}
