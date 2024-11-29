resource "null_resource" "test" {
  provisioner "local-exec" {
    command= "echo Hello world"

  }
}

resource "null_resource" "test1" {
  provisioner "local-exec" {
    command= <<EOF

Hello world
ls pwd
cat
EOF
  }
}
resource "null_resource" "test1" {
   provisioner "local-exec" {
     command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
   }
}