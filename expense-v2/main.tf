#module "frontend" {
#  source = "./app-create"
#  component = "frontend"
#}

#module "backend" {
#  source = "./app-create"
#  component = "frontend"
#}
#
#module "mysql" {
#  source = "./app-create"
#  component = "mysql"
#}

module "expense" {
  count = length(var.expense)
  source = "./app-create"
  component = var.expense[count.index]
}

variable "expense" {
  default = ["frontend , backend, mysql"]

}