resource "null_resource" "mysql" {
  provisioner "local-exec" {
    command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
  }
}