data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

data "aws_security_group" "sg" {
  name= "launch-wizard-1"
}

data "aws_route53_zone" "zone" {
  name = "techadda.co"
}

