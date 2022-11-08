variable "mysql" {}
variable "vpc_id" {}

locals {
  final = "mysql name is: ${var.mysql} and vpc name is: ${var.vpc_id}"
}

output "final" {
  value = local.final
}