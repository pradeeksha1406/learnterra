resource "null_resource" "test" {
  count = 5
  provisioner "local-exec" {
    command ="echo print the index- ${count.index}"
  }

}