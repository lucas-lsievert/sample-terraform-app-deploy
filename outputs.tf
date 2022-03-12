output "app_instance_ip" {
    description = "Ip adress from the app instance"
    value       = module.ec2.app_instance_ip
}