variable "region" {
  description = "Region code"
  type        = string
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.10.0.0/16"
}
variable "subnet_cidr1" {
  description = "subnet1 CIDR range"
  type        = string
  default     = "10.10.1.0/24"
}
variable "subnet_cidr2" {
  description = "subnet2 CIDR range"
  type        = string
  default     = "10.10.2.0/24"
}
variable "cidr_blocks" {
  description = "zeros CIDR block"
  type        = list
  default     = ["0.0.0.0/0"]
}
