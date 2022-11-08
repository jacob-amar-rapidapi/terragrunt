include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//mysql"
}

inputs = {
  length = 5
}