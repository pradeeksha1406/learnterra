resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo Hello-world -${var.env} Environment"
  }
}




