#Create an EC2 instance to deploy applications

resource "aws_instance" "angular_instance" {
  ami           = "ami-053b0d53c279acc90" # OS ubuntu
  instance_type = "t3.micro" 
  key_name = aws_key_pair.kevin_challenge1.key_name
  subnet_id = aws_subnet.subnet_kevin_public.id 
  vpc_security_group_ids = [aws_security_group.security_group_challenge1]

  tags = {
    Name = "angular-instance"
  }
}