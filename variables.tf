variable "aws_region" {
  description = "Região AWS utilizada no projeto"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "terraform-aws-desafio"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR da Subnet Pública 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR da Subnet Pública 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR da Subnet Privada 1"
  type        = string
  default     = "10.0.10.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR da Subnet Privada 2"
  type        = string
  default     = "10.0.20.0/24"
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "public_key_path" {
  description = "Caminho da chave publica SSH"
  type        = string
  default     = "/home/viper/.ssh/id_ed25519.pub"
}

variable "db_name" {
  description = "Nome do banco de dados PostgreSQL"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Usuário administrador do banco"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
  default     = "postgres123"
}

variable "db_allocated_storage" {
  description = "Espaço inicial do banco em GB"
  type        = number
  default     = 20
}

variable "db_instance_class" {
  description = "Classe da instância RDS"
  type        = string
  default     = "db.t3.micro"
}
