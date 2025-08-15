module "dev-app" {
  source = "./modules/aws_infra"
  my-env = "dev"
  instance_type = "t2.micro"
  ami_id = "ami-0144277607031eca2"
  instance_count = 1
}

module "staging-app" {
  source = "./modules/aws_infra"
  my-env = "staging"
  instance_type = "t2.medium"
  ami_id = "ami-0144277607031eca2"
  instance_count = 2
}

module "prod-app" {
  source = "./modules/aws_infra"
  my-env = "prod"
  instance_type = "t2.large"
  ami_id = "ami-0144277607031eca2"
  instance_count = 3
}