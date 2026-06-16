variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR"
  type        = string
}

variable "az_1" {
  description = "Availability Zone 1"
  type        = string
}

variable "az_2" {
  description = "Availability Zone 2"
  type        = string
}
