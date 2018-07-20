module "list" {
  source = "../"
  if = 1
  then = "${list()}"
  else = "${list()}"
}

output "list_output" {
  value = "${module.list.result}"
}

module "list_else" {
  source = "../"
  if = 0
  then = "${list()}"
  else = "${list("else")}"
}

output "list_else_output" {
  value = "${module.list_else.result}"
}
