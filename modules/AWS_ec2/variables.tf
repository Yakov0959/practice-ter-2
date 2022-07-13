variable "subnet_id" {
  type = string
}
variable "ami" {
  type    = string
  default = "ami-05a8c865b4de3b127"
  description = "Amazon Machine Images"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
  description = "Amazon EC2 Instance Types"
}
variable "availability_zones" {
  type    = string
  description = "Availability Zones"
}
variable "ip_adress" {
  type = list
   description = "IP adress"
}
variable "disk_size" {
  type = string
  description = "Disk size"
}
variable "ec2_name" {
  type = string
  description = "Amazon EC2 Instance name"

}
variable "type_hdd" {
  type = string
  description = "Type HDD"
}