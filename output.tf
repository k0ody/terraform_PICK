output "ip_address_control" {
  value = aws_instance.controlPlane-k8s[*].public_ip
}
output "dns_public_control" {
  value = aws_instance.controlPlane-k8s[*].public_dns
}

output "private_ip_address_control" {
  value = aws_instance.controlPlane-k8s[*].private_ip
}



output "ip_address_worker" {
  value = aws_instance.worker-k8s[*].public_ip
}
output "dns_public_worker" {
  value = aws_instance.worker-k8s[*].public_dns
}

output "private_ip_address_worker" {
  value = aws_instance.worker-k8s[*].private_ip
}