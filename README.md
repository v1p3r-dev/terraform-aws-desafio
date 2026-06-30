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

Módulo atual: Módulo 4 — Camada de Computação (EC2)

Situação atual:

- Ambiente Linux configurado
- Docker e LocalStack configurados
- Terraform inicializado
- AWS CLI configurada
- Estrutura do projeto organizada
- Infraestrutura de rede concluída
- Security Group criado
- EC2 configurada
- AMI dinâmica utilizando Data Source
- Key Pair configurado;

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
└── .gitignore

```

---

## Ferramentas Utilizadas

- Terraform
- Git
- GitHub
- Docker
- LocalStack
- AWS CLI

---

## Próximos Passos

- Criar IAM Roles
- Configurar IAM Instance Profile
- Provisionar Bucket S3
- Criar tabela DynamoDB
- Provisionar banco PostgreSQL (RDS)
- Implementar Auto Scaling Group
- Configurar API Gateway
- Criar funções Lambda
- Preparar infraestrutura para deploy em uma conta AWS

---


