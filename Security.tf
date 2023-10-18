#Create Security group with Firewall Rules

resource "aws_security_group" "security_group_challenge1" {
  name        = var.security_group_challenge1
  description = "Challenge1-Terraform Security Group"
  vpc_id      = aws_vpc.vpc_kevin_challenge1.id

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

   ingress {
     description      = "Acess to port 80"
     from_port        = 80
     to_port          = 80
     protocol         = "tcp"
     cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
 
  }

  tags = {
    Name = var.security_group_challenge1
  }
}

resource "aws_key_pair" "kevin_challenge1" {
  key_name   = "Angular-app-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6eB/zyYXQESfKICwWb2p/v46aAlsfqJsogy4yxNvB/6mx5amX88CSQF4VhqXFMBl9rLUUxGtkTda8NzV4ldPUIUqPezk93/PDwE0efQHLNESHcbjq01ItwplFHCEEWGuF6922L2q5CnT7Pa4Kh45xZDD3pVP62ICduQpjFGIkvG+LgdDNNtT7IXFu8WUvZAwJVO9PpXaU8WHgrM0e8iXVMA8PToJaKcnIOhupcmk0gtgdCsu2eo6EgCXegFdKYjNYACBozGGh8lpILqm5SfrrvhAsG1nbeL3LoGvuK9n1XZAAlWEgL4JIFqXiPMRA06fHmfIUN1bBs3tMvBtCERn53fD42bV60N6+8qByK35dKTdVerlgycXMkbRoToAS3KSRlOoXZTutLmOOBGV0ZCjR3+luqY6iGKpmgEWp1+35UcvQKtfHfPQdVz0+BaLP/u2ki3AwPaEzZEOA+Ytuf8ltRkov+DhbPwHCWD0gabOsvBkwmkQ5l+bm1YwT32YycR8="
}
