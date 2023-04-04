output "vpc" {
  
  value = aws_vpc.lu.id
}

output "subnet" {
    value = aws_subnet.public-us-east-1a.id
  
}

output "worker" {
  value = aws_eks_node_group.private-nodes.id
  
}

