provider "aws" {
  region = "eu-west-3" 
  access_key = ""

}

resource "aws_instance" "frontend_instance" {
  ami           = "ami-073acd5509b9bf507"  
  instance_type = "t2.micro"
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              docker pull tat08/frontend
              docker run -d -p 3000:3000 tat08/frontend
              EOF

  tags = {
    Name = "FrontendServer"
  }
}
