output "db_instance_identifier" {
  description = "Identificador da instância RDS"

  value = aws_db_instance.main.id
}

output "db_endpoint" {
  description = "Endpoint do banco PostgreSQL"

  value = aws_db_instance.main.endpoint
}

output "db_port" {
  description = "Porta do banco PostgreSQL"

  value = aws_db_instance.main.port
}

output "db_name" {
  description = "Nome do banco"

  value = aws_db_instance.main.db_name
}

output "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB"
  value       = aws_dynamodb_table.main.name
}

output "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB"
  value       = aws_dynamodb_table.main.arn
}

output "lambda_name" {
  description = "Nome da função Lambda"

  value = aws_lambda_function.main.function_name
}

output "api_url" {
  description = "URL da API Gateway"

  value = aws_apigatewayv2_stage.main.invoke_url
}

output "alb_dns_name" {
  description = "DNS do Application Load Balancer"

  value = aws_lb.main.dns_name
}
