resource "null_resource" "test" {
  provisioner "local-exec" {
    command= "echo Hello world"

  }
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command= <<EOF

Hello world
ls pwd
cat
EOF
  }
}