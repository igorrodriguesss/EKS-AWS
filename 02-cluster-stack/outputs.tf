output "eks_cluster_id" {
  value       = aws_eks_cluster.this.id
  description = "The ID of the EKS cluster"
}

output "eks_subnet_ids" {
  value       = data.aws_subnets.private.ids
  description = "The IDs of the subnets associated with the EKS cluster"
}