#Key Pair
resource "aws_key_pair" "deployer" {
    key_name = "${var.my-env}-tws-terra-key"
    public_key =  file("C:/Users/ADMIN/OneDrive/Desktop/terraform/multi-env/terra-key.pub")
}
#Default VPC
resource "aws_default_vpc" "default" {
  
}

#security group

resource "aws_security_group" "twssecurity" {
   name = "${var.my-env}- ports"
   description = "This SG is to open ports for EC2 Instance"
   vpc_id = aws_default_vpc.default.id


   ingress{
    description = "This is for ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }

   egress {
    description = "This is for outgoing internet"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]

   }
}

resource "aws_instance" "my-instance" {
  count = var.instance_count
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.twssecurity.name]
  tags = {
    Name = "${var.my-env}-terra-automate"
  }
}
