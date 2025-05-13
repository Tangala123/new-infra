output "alb_dns_name" {
  value = aws_lb.alb-main.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.alb-tg.arn
}

output "lb_listener_arn" {
  value = aws_lb_listener.http.arn
}