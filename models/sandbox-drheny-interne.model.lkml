connection: "sandbox-drheny-interne"


datagroup:sandbox_drheny_interne_datagroup{
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "200 hour"
}

persist_with: sandbox_drheny_interne_datagroup

include: "/explores/joinv1.explore.lkml"
