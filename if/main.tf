variable "if" {
  description = "if"
}

variable "then" {
  type        = "list"
  description = "When false this gets returned. must be of the same type as else."
}

variable "else" {
  type        = "list"
  description = "When true this gets returned, must be of the same type as then."
}

locals {
  test = {
    condition = "${var.if}"
    then      = "${var.then}"
    else      = "${var.else}"
  }

  test_result = "${local.test[lookup(local.test, "condition") ? "then" : "else"]}"
}

output "result" {
  value = "${local.test_result}"
}
