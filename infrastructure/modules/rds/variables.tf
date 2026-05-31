variable "name_prefix"        { type = string }
variable "vpc_id"             { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "postgres_password" {
  type      = string
  sensitive = true
}
variable "rds_instance_class" { type = string }
variable "rds_multi_az"       { type = bool }
variable "backend_sg_id"      { type = string }
