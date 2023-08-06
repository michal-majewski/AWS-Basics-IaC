variable "aws_email_alert" {}

variable "my_name" {}

variable "my_ip" {}

variable "ec2_ssh_pub_key" {
  type      = string
  sensitive = true
}

variable "mentoring_program_prefix" {
  type    = string
  default = "cloudx"
}

variable "mentoring_program_path" {
  type    = string
  default = "/cloudx/"
}
