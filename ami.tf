resource "time_sleep" "wait_5_mins" {
  depends_on = [aws_instance.ec2]
  create_duration = "5m"
}

resource "aws_ami_from_instance" "example" {
  depends_on = [ time_sleep.wait_5_mins ]
  name               = "${local.resource_prefix}-ami"
  source_instance_id = aws_instance.ec2.id
}