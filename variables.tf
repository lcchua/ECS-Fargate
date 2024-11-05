variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-09763ca5e98145a0a"
}

variable "ex_role_arn" {
  description = "The arn of execution role"
  type        = string
  default     = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
}

variable "sg_id" {
  description = "The security group id"
  type        = string
  default     = "sg-0eb49c0c04e0b11e9"
}
