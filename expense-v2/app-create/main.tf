resource "aws_instance" "instance" {
  ami                    = local.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "var.component"
  }
}

resource "aws_route53_record" "record" {
  zone_id = local.zone_id
  name    = "${var.component}frontend.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.private_ip]
}

resource "null_resource" "ansible" {
  depends_on = [aws_route53_record.record]
  provisioner "local-exec" {
    command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
  }
}