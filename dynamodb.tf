resource "aws_dynamodb_table" "main" {
  name         = "Pedidos"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "clienteId"
  range_key = "pedidoId"

  attribute {
    name = "clienteId"
    type = "S"
  }

  attribute {
    name = "pedidoId"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  global_secondary_index {
    name            = "status-index"
    hash_key        = "status"
    projection_type = "ALL"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name = "${var.project_name}-dynamodb"
  }
}
