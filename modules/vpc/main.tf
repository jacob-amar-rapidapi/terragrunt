variable "account_id" {}
variable "region" {}
locals {
  name = "${var.account_id}-${var.region}"
}

output "vpc_id" {
  value = local.name
}