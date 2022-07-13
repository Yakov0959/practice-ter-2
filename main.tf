module "aws_vpc" {
  source     = "./modules/AWS_network"
  cidr_block_vpc = "10.0.0.0/16"
  vpc_name = "my_vpc"
  subnet_name = "my_subnet"
  cidr_block = "10.0.0.0/24"
  availability_zones = var.availability_zones
  nat = "my_nat"

}
module "aws_ec2" {
  source = "./modules/AWS_ec2"
  subnet_id = module.aws_vpc.mysubnet_id
  ip_adress = ["10.0.0.100"]
  instance_type = "t2.micro"
  type_hdd = "standard"
  disk_size = 5
  ec2_name = "my-instance"
  availability_zones = var.availability_zones
}



