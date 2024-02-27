variable "aws_region" {
  description = "AWS Region"
  default = "us-east-1"
}
variable "ecs_task_execution_role_name" {
  default = "ecs_task_exec_role"
}
variable "az_count" {
  default = "2"
}
variable "ami_image" {
  default = "ami-0440d3b780d96b29d"
}
variable "instance_type" {
  default = "t3.small"
}
