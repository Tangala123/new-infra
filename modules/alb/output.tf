output "alb_dns_name" {
  value       = aws_lb.alb-main.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "target_group_arn" {
  value       = aws_lb_target_group.alb-tg.arn
  description = "The ARN of the target group"
}

output "lb_listener_arn" {
  value       = aws_lb_listener.http.arn
  description = "The ARN of the load balancer listener"
}