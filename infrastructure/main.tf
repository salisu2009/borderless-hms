terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment after running: terraform apply -target=module.state_bucket
  # backend "s3" {
  #   bucket       = "borderless-hms-terraform-state-<your-account-id>"
  #   key          = "production/terraform.tfstate"
  #   region       = "us-east-1"
  #   encrypt      = true
  #   use_lockfile = true
  # }
}

provider "aws" {
  region = var.aws_region
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

module "state_bucket" {
  source      = "./modules/state_bucket"
  bucket_name = var.state_bucket_name
}

module "vpc" {
  source      = "./modules/vpc"
  name_prefix = local.name_prefix
  aws_region  = var.aws_region
}

module "ecr" {
  source      = "./modules/ecr"
  name_prefix = local.name_prefix
}

module "alb" {
  source            = "./modules/alb"
  name_prefix       = local.name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "rds" {
  source              = "./modules/rds"
  name_prefix         = local.name_prefix
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  postgres_password   = var.postgres_password
  rds_instance_class  = var.rds_instance_class
  rds_multi_az        = var.rds_multi_az
  backend_sg_id       = module.ecs.backend_sg_id
}

module "ecs" {
  source                    = "./modules/ecs"
  name_prefix               = local.name_prefix
  aws_region                = var.aws_region
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  public_subnet_ids         = module.vpc.public_subnet_ids
  alb_sg_id                 = module.alb.alb_sg_id
  frontend_tg_arn           = module.alb.frontend_tg_arn
  backend_tg_arn            = module.alb.backend_tg_arn
  backend_ecr_image         = "${module.ecr.backend_repository_url}:latest"
  frontend_ecr_image        = "${module.ecr.frontend_repository_url}:latest"
  db_host                   = module.rds.db_host
  db_name                   = "hospital_db"
  db_user                   = "postgres"
  db_password               = var.postgres_password
  jwt_secret_key            = var.jwt_secret_key
  frontend_min_tasks        = var.frontend_min_tasks
  frontend_max_tasks        = var.frontend_max_tasks
  backend_min_tasks         = var.backend_min_tasks
  backend_max_tasks         = var.backend_max_tasks
}

module "cloudwatch" {
  source              = "./modules/cloudwatch"
  name_prefix         = local.name_prefix
  ecs_cluster_name    = module.ecs.cluster_name
  backend_service_name = module.ecs.backend_service_name
}
