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
  branch = {
    then      = "${var.then}"
    else      = "${var.else}"
  }

  test_result = "${local.branch[var.if ? "then" : "else"]}"
}

output "result" {
  value = "${local.test_result}"
}
