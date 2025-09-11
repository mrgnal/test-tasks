module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.eks_cluster_name
  kubernetes_version = var.eks_cluster_version


  addons = {
    coredns                = {}
    eks-pod-identity-agent = { before_compute = true }
    kube-proxy             = {}
    vpc-cni                = { before_compute = true }
  }

  endpoint_public_access = var.eks_public_access
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = aws_vpc.main.id
  subnet_ids               = [for s in aws_subnet.private : s.id ]
  control_plane_subnet_ids = [for s in aws_subnet.public: s.id ]

  eks_managed_node_groups = {
    example = {
      ami_type       = var.ami_type
      instance_types = var.instance_types
      min_size       = 2
      max_size       = 10
      desired_size   = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}