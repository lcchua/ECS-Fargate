variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-0a5f0c3cfe076c4d3"
}

variable "ex_role_arn" {
  description = "The arn of execution role"
  type        = string
  default     = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
}

variable "sg_id" {
  description = "The security group id"
  type        = string
  default     = "sg-0cd2487ae1c22cb8e"
}
