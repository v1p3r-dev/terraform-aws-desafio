# Terraform AWS Challenge

**Autor:** Victor Lessa

## Sobre o Projeto

Este projeto faz parte da formação **Cloud Computing e Infraestrutura Inteligente**, promovida pela **Oxetech**, iniciativa do Governo de Alagoas voltada à capacitação e profissionalização de talentos na área de tecnologia.

O objetivo é desenvolver uma infraestrutura completa na AWS utilizando Terraform, aplicando os conceitos de Infrastructure as Code (IaC), automação, versionamento e boas práticas de provisionamento em nuvem.

Durante o desenvolvimento serão implementados recursos como:

- VPC
- Subnets públicas e privadas
- Internet Gateway
- Security Groups
- Instâncias EC2
- Banco de dados PostgreSQL (RDS)
- Buckets S3
- Tabelas DynamoDB
- Funções Lambda
- API Gateway
- IAM Roles e Policies

Além da construção da infraestrutura, o projeto também documenta o processo de aprendizado, as decisões técnicas e os desafios encontrados ao longo da jornada.

Toda a infraestrutura será provisionada na AWS utilizando Terraform como ferramenta principal de automação.

---

## Formação

- Programa: Oxetech
- Instituição: Governo de Alagoas
- Trilha: Cloud Computing e Infraestrutura Inteligente
- Tecnologias principais: AWS, Azure, GCP, Terraform, Docker, Git e Linux

---

## Status Atual

Módulo atual: Conclusão do Projeto

Situação atual:

- Infraestrutura de rede totalmente provisionada
- Security Groups separados por camada
- EC2 pública criada com User Data
- IAM Roles, Policies e Instance Profile configurados
- Bucket S3 com criptografia e versionamento
- DynamoDB com GSI e Point-in-Time Recovery
- Função AWS Lambda criada
- API Gateway integrado à Lambda
- Auto Scaling Group configurado
- Launch Template criado
- Application Load Balancer (ALB) configurado
- Target Group e Listener configurados
- Banco PostgreSQL (RDS) configurado
- Outputs Terraform adicionados
- Provisionamento validado utilizando AWS real


---

## Objetivos de Aprendizado

- Aprender Terraform
- Aprender Infrastructure as Code (IaC)
- Aprender versionamento com Git
- Aprender integração com GitHub
- Aprender Docker
- Aprender LocalStack
- Aprender serviços AWS

---

## Jornada de Desenvolvimento

### Módulo 1 - Preparação do Ambiente

- [x] Git instalado
- [x] Repositório Git criado
- [x] Repositório GitHub criado
- [x] Personal Access Token configurado
- [x] Push para GitHub realizado
- [x] Docker instalado
- [x] Estrutura inicial do projeto criada
- [x] Arquivo .gitignore criado
- [x] LocalStack iniciado
- [x] LocalStack validado via Health Check
- [x] Terraform instalado
- [x] AWS CLI configurada

---

### Módulo 2 - Configuração do Terraform

- [x] Provider AWS configurado
- [x] Variáveis do projeto criadas
- [x] Data Source das Availability Zones configurado
- [x] Estrutura inicial dos arquivos Terraform criada

---

### Módulo 3 - Infraestrutura de Rede

- [x] VPC criada
- [x] Duas Subnets Públicas
- [x] Duas Subnets Privadas
- [x] Internet Gateway
- [x] Elastic IP para NAT Gateway
- [x] NAT Gateway
- [x] Route Tables
- [x] Associações das Route Tables

---

### Módulo 4 - Camada de Computação

- [x] Security Group criado
- [x] Regras Ingress configuradas
- [x] Regras Egress configuradas
- [x] Data Source da AMI criado
- [x] Variáveis da EC2 configuradas
- [x] Key Pair configurado
- [x] Instância EC2 configurada

---

### Módulo 5 - Armazenamento (Amazon S3)

- [x] Bucket S3 criado
- [x] Versionamento habilitado
- [x] Criptografia padrão configurada
- [x] Bloqueio de acesso público configurado

---

### Módulo 6 - Banco de Dados NoSQL

- [x] Tabela DynamoDB criada
- [x] Chave primária configurada
- [x] Billing Mode configurado
- [x] Tags adicionadas

---

### Módulo 7 - Gerenciamento de Identidade (IAM)

- [x] IAM Role criada para EC2
- [x] IAM Policy criada
- [x] Permissões para acesso ao S3 configuradas
- [x] Policy anexada à Role
- [x] Instance Profile criado
- [x] EC2 associada ao Instance Profile

---

### Módulo 8 - Banco de Dados Relacional (Amazon RDS)

- [x] DB Subnet Group criado
- [x] PostgreSQL configurado
- [x] Security Group exclusivo para RDS
- [x] Banco privado utilizando subnets privadas
- [x] Outputs do banco adicionados

---

### Módulo 9 - Serverless

- [x] Função Lambda criada
- [x] IAM Role da Lambda
- [x] IAM Policy da Lambda
- [x] Código empacotado em ZIP
- [x] Integração com API Gateway

---

### Módulo 10 - API Gateway

- [x] HTTP API criada
- [x] Integração AWS_PROXY
- [x] Stage automático
- [x] Permissão de Invoke para Lambda

---

### Módulo 11 - Alta Disponibilidade

- [x] Launch Template criado
- [x] Auto Scaling Group criado
- [x] Política de Auto Scaling por CPU
- [x] Application Load Balancer criado
- [x] Listener HTTP criado
- [x] Target Group configurado

---


---
## Estrutura Atual

```
terraform-aws-desafio/

├── alb.tf
├── api.tf
├── asg.tf
├── data.tf
├── dynamodb.tf
├── ec2.tf
├── iam.tf
├── lambda.tf
├── nat.tf
├── provider.tf
├── rds.tf
├── route.tf
├── s3.tf
├── security.tf
├── subnet.tf
├── variables.tf
├── vpc.tf
├── outputs.tf
├── terraform.tfvars.example
├── README.md
├── diario-aprendizado.md
├── autoscaling_policy.tf
├── lambda/
│   └── lambda_function.py
├── lambda.zip└── .gitignore

```

---

## Ferramentas Utilizadas

- Terraform
- AWS CLI
- Git
- GitHub
- Docker
- LocalStack
- Linux
- Visual Studio Code

---

## Próximos Passos

- Corrigir warnings de depreciação do DynamoDB
- Ajustar versões do PostgreSQL conforme disponibilidade da região
- Implementar monitoramento com CloudWatch
- Automatizar deploy utilizando GitHub Actions
- Configurar Remote Backend do Terraform
- Aprimorar documentação técnica

---

## Conhecimentos Adquiridos

Durante o desenvolvimento deste projeto foram praticados conceitos de:

- Infrastructure as Code (IaC)
- Provisionamento automatizado na AWS
- Terraform Modules e organização de arquivos
- Redes (VPC, Subnets, NAT Gateway e Internet Gateway)
- Segurança utilizando Security Groups
- IAM Roles, Policies e Instance Profiles
- Auto Scaling
- Load Balancer
- Banco de dados relacional (RDS)
- Banco NoSQL (DynamoDB)
- Serverless com AWS Lambda
- API Gateway
- Versionamento com Git e GitHub
- Organização de projetos Terraform em ambiente real
