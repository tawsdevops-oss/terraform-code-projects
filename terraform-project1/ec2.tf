# Fetch latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro" # t3.micro is typically used in ap-south-2 as t2 series might not be available
  subnet_id     = aws_subnet.public.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd git
              sudo systemctl start httpd
              sudo systemctl enable httpd
              
              # Clone the website code from your public Git repository
              # NOTE: Replace the GitHub URL below with your actual repository URL
              git clone https://github.com/tawsdevops-oss/terraform-demo-code.git /tmp/website
              sudo cp -R /tmp/website/* /var/www/html/
              sudo systemctl restart httpd
              EOF

  tags = {
    Name = "hyd-web-server"
  }
}
