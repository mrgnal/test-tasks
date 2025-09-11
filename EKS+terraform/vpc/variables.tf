#Global
variable "region" {
    type = string
    default = "eu-north-1"
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