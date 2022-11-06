output "elastic_IP" {
    value = aws_eip.nat.id
}
