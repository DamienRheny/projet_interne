include: "/views/01_based_views/mapping_unite.view.lkml"
view: +mapping_unite{


  parameter: choiceCurrency2 {
    type: unquoted
    label: "TESTChoose the unit of the dashboard, Bytes or Price"
    suggest_dimension: unite
#    allowed_value: {
#      value: "B"
#      label: "Bytes"
#    }
#    allowed_value: {
#      value: "P"
#      label: "Price"
#    }
#    default_value: "P"
  }


  parameter: choiceUnit2{
    type: unquoted
    label: "TESTChoose bytes, megabytes, gigabytes"
    suggest_dimension: valeur
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
  }
}
