project_name: "sandbox-drheny-interne"

## Use local_dependency: To enable referencing of another project
# on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

constant: bq_project {
value: "sandbox-drheny"
export: override_optional
}

constant: bq_dataset {
  value: "Looker_AllData"
  export: override_optional
}
