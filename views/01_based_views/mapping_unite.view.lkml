view: mapping_unite {
  sql_table_name: `@{bq_project}.@{bq_dataset}.mapping_unite`
    ;;

  dimension: unite {
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  dimension: valeur {
    type: string
    sql: ${TABLE}.string_field_1 ;;
  }

  dimension: conversion {
    type: string
    sql: ${TABLE}.string_field_2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
