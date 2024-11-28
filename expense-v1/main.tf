resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-098eb31481a73cb9c"]

  tags = {
    Name = "frontend"
  }
}