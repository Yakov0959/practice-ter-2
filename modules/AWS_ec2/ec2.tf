resource "aws_network_interface" "my_ne" {
  subnet_id   = var.subnet_id
  private_ips = var.ip_adress
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name               = "terraform_test"
  tags = {
    Name = var.ec2_name
  }


  network_interface {
    network_interface_id = aws_network_interface.my_ne.id
    device_index         = 0
  }
  user_data = <<EOF
   #!/bin/bash
   sudo systemctl stop ufw
   sudo apt update
   sudo apt install -y nginx
   sudo systemctl start nginx
   systemctl enable nginx
   EOF
}


resource "aws_ebs_volume" "disk" {
  availability_zone = var.availability_zones
  size              = var.disk_size
  type = var.type_hdd
}


resource "aws_volume_attachment" "disk_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.disk.id
  instance_id = aws_instance.my_ec2.id
}
