provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "lu-sprints" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  user_data                   = file(var.script)
  subnet_id                   = var.public_subnet_id
  key_name                    = "sprints"
  associate_public_ip_address = true
  vpc_security_group_ids  = [aws_security_group.web.id]

    provisioner "file" {
    source = "/home/lu/.aws"
    destination = "/home/ubuntu/.aws"
      connection {
      user        = "ubuntu"
      type        = "ssh"
      private_key = file("/home/lu/sprints-project/ansible/sprints.pem")
      host        = aws_instance.lu-sprints.public_ip
    }
  }
  provisioner "local-exec" {
      connection {
      user        = "ubuntu"
      type        = "ssh"
      private_key = file("/home/lu/sprints-project/ansible/sprints.pem")
      host        = aws_instance.lu-sprints.public_ip
    }
    command = "echo ${aws_instance.lu-sprints.public_ip} >> /home/lu/sprints-project/ansible/inventory"
    
  }
  provisioner "local-exec" {
      command = "ansible-playbook -i inventory /home/lu/sprints-project/ansible/app.yml"
    }

  provisioner "file" {
      connection {
      user        = "ubuntu"
      type        = "ssh"
      private_key = file("/home/lu/sprints-project/ansible/sprints.pem")
      host        = aws_instance.lu-sprints.public_ip
    }
    source = "/home/lu/sprints-project/k8s"
    destination = "/home/ubuntu/k8s"
    
  }

  depends_on = [
    var.worker
  ]

  tags = {
    Name = "Sprints"

  }
}


