variable "region" {}

variable "length" {}
resource "random_pet" "this" {
  length = var.length
}
variable "account_id" {}
locals {
  name = "${random_pet.this.id}-${var.region}-${var.account_id}"
}

output "name" {
  value = local.name
}