# EC2インスタンスの作成
resource "aws_instance" "sample_web_server" {
    ami = "ami-072bfb8ae2c884cc4" # AWSコンソール上で確認すること
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sample_subnet.id
    vpc_security_group_ids = [aws_security_group.sample_sg.id]

    user_data = <<EOF
    #!/bin/bash
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd

    EOF
}