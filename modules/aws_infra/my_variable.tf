variable "my-env" {
    description = "This is the environment for infra"
    type = string 
}

variable "ami_id" {
    description = "This is the AMI ID for EC2 instance"
    type = string
  
}

variable "instance_type" {
  description = "This is the type of EC2 instance"
  type = string
}

variable "instance_count"{
  description = "This is the EC2 instace count"
  type = number
}