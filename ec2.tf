resource "aws_instance" "controlPlane-k8s" {
  ami                         = data.aws_ami.ubuntu-aws.id
  instance_type               = var.instance_type
  count                       = 1
  vpc_security_group_ids      = [aws_security_group.k8s-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "controllplane"
  }

}

resource "aws_instance" "worker-k8s" {
  ami                         = data.aws_ami.ubuntu-aws.id
  instance_type               = var.instance_type
  count                       = 2
  vpc_security_group_ids      = [aws_security_group.k8s-sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "worker"
  }

}