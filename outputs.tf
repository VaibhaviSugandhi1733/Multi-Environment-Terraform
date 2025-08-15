output "dev_app_ips" {
  value = module.dev-app.ec2_instances_public_ips
}

output "staging_app_ips" {
  value = module.staging-app.ec2_instances_public_ips
}

output "prod_app_ips" {
  value = module.prod-app.ec2_instances_public_ips
}
