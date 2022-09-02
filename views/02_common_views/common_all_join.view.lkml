include: "/views/01_based_views/all_join.view.lkml"

view: +all_join {

  dimension: choicePriceBytes{
    description: "choice"
    type: string
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

  measure: chooseMeasure {
    description: "choose right mesaure"
    type: number
    sql: if(${choicePriceBytes}='bytes',${sum_of_bytes},${sum_of_price}) ;;
  }
}
