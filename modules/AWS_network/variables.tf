variable "cidr_block_vpc" {
  type = string
  default ="10.0.0.0/16"
}
variable "cidr_block" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "subnet_name" {
  type = string
//  default = "my_subnet"
}
variable "nat" {
  type = string
}

variable "availability_zones" {
  type        = string
  description = "Availability Zones"
}


