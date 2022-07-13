variable "AK" {
  type        = string
  description = "access key ID"
}

variable "SK" {
  type        = string
  description = "secret access key"
}

variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "Regions"
}

variable "availability_zones" {
  type        = string
  default     = "eu-west-2c"
  description = "Availability Zones"
}
