variable "fruit" {
  default = "apple"

}

variable "fruits" {
  default =["apple" ,"banana"]

}

variable "fruits_price" {
  default = {
    apple=10
    banana=20
  }
}

output "fruit" {
  value = var.fruit
}


output "fruits" {
  value = var.fruits[1]
}

output "fruits_price" {
  value = "price of apple= ${var.fruits_price[0]}"
}