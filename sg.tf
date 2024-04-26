resource "aws_security_group" "k8s-sg" {
  name        = "cluster-k8s-sg"
  description = "Security Group referente ao cluster k8s"
}

resource "aws_security_group_rule" "ssh" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = ["0.0.0.0/0"]
  
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_api_server" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 6443
  to_port                  = 6443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_kubelet" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 10250
  to_port                  = 10255
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_NodePort" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 32767
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_waeave_tcp" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 6783
  to_port                  = 6783
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_weave_udp" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 6783
  to_port                  = 6784
  protocol                 = "udp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "allow_inbound_cluster_k8s_etcd" {
  security_group_id        = aws_security_group.k8s-sg.id
  type                     = "ingress"
  from_port                = 2379
  to_port                  = 2380
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s-sg.id
}

resource "aws_security_group_rule" "k8s_outbound" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
