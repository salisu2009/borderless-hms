Readme · MDCopyBorderless HMS 🏥

Enterprise Hospital Management System | Production Deployed on AWS

🚀 Status: Live in Production
Live Application: http://borderless-hms-production-alb-155215995.us-east-1.elb.amazonaws.com
✅ Full infrastructure deployed and running on AWS
✅ Docker images built and pushed to ECR
✅ CI/CD pipeline automated with GitHub Actions
✅ Database, Load Balancer, and ECS services operational

Borderless HMS is a hospital management system built with a modern React frontend and a FastAPI backend. It is designed to be deployable locally with Docker and scalable using Terraform infrastructure modules.
📊 Production Infrastructure
ComponentDetailsFrontendReact 18 + Vite (ECS Fargate)BackendFastAPI + SQLAlchemy (ECS Fargate)DatabasePostgreSQL 16 (RDS)Load BalancerAWS ALB with auto-scalingContainer RegistryAWS ECRMonitoringCloudWatch logs & alarmsInfrastructureTerraform IaC
AWS Resources Deployed

VPC: vpc-003239ddb86637b6e
ECS Cluster: borderless-hms-production-cluster
RDS Endpoint: borderless-hms-production-db.cat8s2wy8i6t.us-east-1.rds.amazonaws.com
Load Balancer: borderless-hms-production-alb
Backend ECR: 117370071855.dkr.ecr.us-east-1.amazonaws.com/borderless-hms-production/backend
Frontend ECR: 117370071855.dkr.ecr.us-east-1.amazonaws.com/borderless-hms-production/frontend


Project structure

backend/ - FastAPI service with SQLAlchemy models, Pydantic schemas, authentication, and API routes.
frontend/ - React + Vite frontend using Tailwind CSS, React Router, React Query, and charts.
infrastructure/ - Terraform state and configuration for cloud infrastructure (VPC, ECS, RDS, ALB, ECR, CloudWatch).
docker-compose.yml - local development orchestration for backend, frontend, and database services.

Tech stack

Frontend: React 18, Vite, Tailwind CSS, React Router, React Query
Backend: FastAPI, SQLAlchemy, Alembic, Pydantic, Uvicorn
Database: PostgreSQL 16
Containerization: Docker, ECS Fargate
Infrastructure: Terraform, AWS (VPC, ALB, RDS, ECR, CloudWatch)
CI/CD: GitHub Actions
Region: AWS us-east-1

Getting started
1. Local environment

Copy environment variables:

bash   cp .env.example .env

Install backend dependencies:

bash   cd backend
   python -m venv venv
   .\venv\Scripts\Activate.ps1  # or source venv/bin/activate on Linux/macOS
   pip install -r requirements.txt

Install frontend dependencies:

bash   cd ..\frontend
   npm install
2. Run locally

Start backend:

bash  cd backend
  uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

Start frontend:

bash  cd frontend
  npm run dev
3. Docker development
If you prefer Docker, use:
bashdocker compose up --build
Deployment
Production Deployment (AWS)
The infrastructure is provisioned using Terraform modules located in the infrastructure/ folder:
bash# Navigate to infrastructure folder
cd infrastructure

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
The project includes reusable modules for:

VPC: Public/private subnets, NAT gateway, Internet gateway
ECS: Fargate cluster, task definitions, services, auto-scaling
RDS: PostgreSQL database with multi-AZ backup
ALB: Application Load Balancer with health checks
ECR: Docker image repositories for backend and frontend
CloudWatch: Logs and performance metrics
S3: Terraform state storage

CI/CD Pipeline
GitHub Actions automatically:

Builds Docker images on code push
Pushes images to AWS ECR
Validates Terraform configuration
Deploys updates to ECS services

Notes

The backend expects environment variables from .env.
The frontend communicates with the backend API, so update any base URL settings if needed.
Use npm run build in frontend/ to create a production build.
Production secrets are stored in AWS Systems Manager Parameter Store.
All database passwords and JWT secrets are encrypted and not exposed in code.

Key Features
✅ Patient appointment scheduling and management
✅ Physician scheduling and resource optimization
✅ Comprehensive patient record management
✅ Secure API authentication with JWT
✅ Role-based access control
✅ Real-time data persistence
✅ CloudWatch monitoring and alerting
✅ Auto-scaling based on demand
✅ Infrastructure as Code (Terraform)
Goals

Provide a clean, intuitive UI for hospital appointments, patients, doctors, and authentication.
Support secure API access and reliable database persistence.
Enable containerized local development and cloud-native production deployment.
Demonstrate modern full-stack development and DevOps best practices.