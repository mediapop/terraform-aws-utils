# Terraform utils

*This terraform module is maintained by [Media Pop](https://www.mediapop.co), a software consultancy. Hire us to solve your DevOps challenges.*

Repackage awkward terraform hacks into generic modules.

 # If then else

Works around for [conditional operator cannot be used with list values](https://github.com/hashicorp/terraform/issues/18259) 
 
```hcl

locals = {
   use_good_letters = true
   good_letters     = "${list("a", "b")}"
   bad_letters      = "${list("c")}"
}

module "letters_lookup" {
  source = "mediapop/aws/utils/if"
  if     = "${local.use_good_letters}"
  then   = "${local.good_letters}"
  else   = "${local.bad_letters}"
}

output "letters" {
  value = "${module.letters_lookup.result}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| if | The condition. | string | - | yes |
| then | Value when true | list | - | yes |
| else | Value when false | list | - | yes |

## Outputs

| Name | Description | Type |
|------|-------------|:----:|
| result | The result of the evaluation | any |
