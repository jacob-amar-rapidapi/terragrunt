include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "..//vpc"
  mock_outputs = { # using mock outputs since vpc id not yet created while applying app https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#unapplied-dependency-and-mock-outputs
    vpc_id = "temporary-dummy-id"
  }
}

dependency "mysql" {
  config_path  = "..//mysql"
  mock_outputs = {
    name = "temporary-name-id"
  }
}

terraform {
  source = "../../../stacks//app"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  mysql = dependency.mysql.outputs.name
}
