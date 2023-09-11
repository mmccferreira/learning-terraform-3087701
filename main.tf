data "aws_ami" "app_ami" {
  most_recent = true

# this deploys a tomcat server by using this filter to find the latest version of this bitnami tomcat server
  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

# it takes the image created above (aws_ami) and then it provisions an aws instance named 'web'
resource "aws_instance" "blog" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
