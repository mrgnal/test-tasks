output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_s_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_s_ids" {
  value = [for s in aws_subnet.private : s.id]
}