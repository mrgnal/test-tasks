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

#VPC
variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
    type = map(object({
    cidr = string
    az   = string
    }))
}

variable "private_subnets" {
    type = map(object({
    cidr = string
    az   = string
    }))
}