//asg config
resource "aws_autoscaling_group" "asg1" {
  name             = "ASG1"
  max_size         = 5
  min_size         = 1
  desired_capacity = 2
  launch_template {
    id      = var.ltid
    version = var.ltver
  }
  health_check_type   = "ELB"
  vpc_zone_identifier = [data.aws_subnet.defsubnet1.id, data.aws_subnet.defsubnet2.id]
  target_group_arns   = [aws_alb_target_group.tg1.arn]
  depends_on          = [aws_launch_template.lt1, aws_alb_target_group.tg1]
}