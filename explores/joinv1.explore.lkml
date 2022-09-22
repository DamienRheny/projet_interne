include: "/views/**/*.view"

explore: joinv1  {

  join: mapping_unite {
    type: cross
    sql_on: 1=1 ;;
    relationship: one_to_one
  }

}
