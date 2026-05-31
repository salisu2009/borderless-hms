# Borderless HMS

Borderless HMS is a hospital management system built with a modern React frontend and a FastAPI backend. It is designed to be deployable locally with Docker and scalable using Terraform infrastructure modules.

## Project structure

- `backend/` - FastAPI service with SQLAlchemy models, Pydantic schemas, authentication, and API routes.
- `frontend/` - React + Vite frontend using Tailwind CSS, React Router, React Query, and charts.
- `infrastructure/` - Terraform state and configuration for cloud infrastructure.
- `docker-compose.yml` - local development orchestration for backend, frontend, and database services.

## Tech stack

- Frontend: React 18, Vite, Tailwind CSS, React Router, React Query
- Backend: FastAPI, SQLAlchemy, Alembic, Pydantic, Uvicorn
- Database: PostgreSQL
- Containerization: Docker
- Infrastructure: Terraform

## Getting started

### 1. Local environment

1. Copy environment variables:
   ```bash
   cp .env.example .env
   ```
2. Install backend dependencies:
   ```bash
   cd backend
   python -m venv venv
   .\venv\Scripts\Activate.ps1  # or source venv/bin/activate on Linux/macOS
   pip install -r requirements.txt
   ```
3. Install frontend dependencies:
   ```bash
   cd ..\frontend
   npm install
   ```

### 2. Run locally

- Start backend:
  ```bash
  cd backend
  uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
  ```
- Start frontend:
  ```bash
  cd frontend
  npm run dev
  ```

### 3. Docker development

If you prefer Docker, use:
```bash
docker compose up --build
```

## Deployment

- Use the Terraform configuration in `infrastructure/` to provision cloud resources.
- The project includes reusable modules for VPC, ECS, ALB, RDS, ECR, CloudWatch, and S3 state storage.

## Notes

- The backend expects environment variables from `.env`.
- The frontend communicates with the backend API, so update any base URL settings if needed.
- Use `npm run build` in `frontend/` to create a production build.

## Goals

- Provide a clean UI for hospital appointments, patients, doctors, and authentication.
- Support secure API access and database persistence.
- Enable containerized local development and cloud deployment.
