variable "name_prefix"         { type = string }
variable "aws_region"          { type = string }
variable "vpc_id"              { type = string }
variable "private_subnet_ids"  { type = list(string) }
variable "public_subnet_ids"   { type = list(string) }
variable "alb_sg_id"           { type = string }
variable "frontend_tg_arn"     { type = string }
variable "backend_tg_arn"      { type = string }
variable "backend_ecr_image"   { type = string }
variable "frontend_ecr_image"  { type = string }
variable "db_host"             { type = string }
variable "db_name"             { type = string }
variable "db_user"             { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "jwt_secret_key" {
  type      = string
  sensitive = true
}
variable "frontend_min_tasks"  { type = number }
variable "frontend_max_tasks"  { type = number }
variable "backend_min_tasks"   { type = number }
variable "backend_max_tasks"   { type = number }
