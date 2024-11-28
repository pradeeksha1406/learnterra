resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-098eb31481a73cb9c"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z05654563PV59AYGYWWC"
  name    = "frontend"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "backend" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-098eb31481a73cb9c"]

  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z05654563PV59AYGYWWC"
  name    = "backend"
  type    = "A"
  ttl     = 300
  records = [aws_instance.backend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-098eb31481a73cb9c"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z05654563PV59AYGYWWC"
  name    = "mysql"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}