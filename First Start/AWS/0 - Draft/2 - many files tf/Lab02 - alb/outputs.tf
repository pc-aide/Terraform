################################################
# OUTPUTS
################################################

output "alb-dns-name" {
  value = aws_lb.alb-nginx.dns_name
}
