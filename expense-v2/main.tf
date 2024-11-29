module "frontend" {
  source = "./app-create"
  component = "frontend"
}

#module "backend" {
#  source = "./app-create"
#  component = "frontend"
#}
#
#module "mysql" {
#  source = "./app-create"
#  component = "mysql"
#}