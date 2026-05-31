output "cluster_name"          { value = aws_ecs_cluster.main.name }
output "backend_service_name"  { value = aws_ecs_service.backend.name }
output "frontend_service_name" { value = aws_ecs_service.frontend.name }
output "backend_sg_id"         { value = aws_security_group.backend.id }
