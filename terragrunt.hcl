remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "skip"
  }
  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }
}

terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply"]
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../account.tfvars",
      "-var-file=${get_terragrunt_dir()}/../region.tfvars"
    ]
  }
}
