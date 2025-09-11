#Global
variable "region" {
    type = string
    default = "eu-north-1"
}

#EKS
variable "eks_cluster_name" {
  type = string
}

variable "eks_cluster_version" {
  type = string
}

variable "eks_public_access" {
  type = bool
  default = true
}

variable "ami_type" {
  type = string
}

variable "instance_types" {
  type = list
}

#S3 remote
variable "backend_bucket_name" {
  type = string
}

variable "vpc_backend_bucket_key" {
  type = string
}