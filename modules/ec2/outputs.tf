output "app_instance_ip" {
    description = "Ip adress from the application instance"
    value       = aws_instance.this.public_ip
}