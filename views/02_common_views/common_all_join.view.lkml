include: "/views/01_based_views/all_join.view.lkml"

view: +all_join {


  parameter: choiceCurrency {
    type: unquoted
    label: "Choose the unit of the dashboard, Bytes or Price"
    allowed_value: {
      value: "B"
      label: "Bytes"
    }
    allowed_value: {
      value: "P"
      label: "Price"
    }
    default_value: "P"
  }

  parameter: choiceUnit{
    type: unquoted
    label: "Choose bytes, megabytes, gigabytes"
    allowed_value: {
      value: "euro"
      label: "Euro"
    }
    allowed_value: {
      value: "dollar"
      label: "Dollar"
    }
    allowed_value: {
      value: "bytes"
      label: "Bytes"
    }
    allowed_value: {
      value: "megabytes"
      label: "Megabytes"
    }
    allowed_value: {
      value: "gigabytes"
      label: "Gigabytes"
    }
    default_value: "euro"
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
  }


  measure: unit {
    description: "Choose bytes, megabytes, gigabytes"
    type: number
    sql: {% if choiceUnit._parameter_value == "bytes" %}
      ${sum_of_bytes}
    {% elsif choiceUnit._parameter_value == "megabytes" %}
      ${sum_of_bytes}*9.5367431640625*POWER(10,-7)
    {% elsif choiceUnit._parameter_value == "gigabytes" %}
      ${sum_of_bytes}*9.313225746154785*POWER(10,-10)
    {% elsif choiceUnit._parameter_value == "dollar" %}
      ${sum_of_price}
    {% elsif choiceUnit._parameter_value == "euro" %}
      ${sum_of_price}
    {% else %}
      ${sum_of_price}
  {% endif %} ;;
  }
}
