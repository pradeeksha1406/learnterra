resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.zone.id
  name    = "frontend.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "null_resource" "frontend" {
  depends_on = [aws_route53_record.frontend]
  provisioner "local-exec" {
    command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
  }
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = data.aws_route53_zone.zone.id
  name    = "backend.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.backend.private_ip]
}

resource "null_resource" "backend" {
  depends_on = [aws_route53_record.backend]
  provisioner "local-exec" {
    command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
  }
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = data.aws_route53_zone.zone.id
  name    = "mysql.${var.zone_id}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}

resource "null_resource" "mysql" {
  depends_on = [aws_route53_record.mysql]
  provisioner "local-exec" {
    command = <<EOF
       cd /etc
       cat passwd | grep root
EOF
  }
}