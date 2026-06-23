# Diário de Aprendizado

## Objetivo

Documentar minha evolução durante o desenvolvimento do projeto Terraform AWS Challenge.

---

## Módulo 1 - Preparação do Ambiente

### Etapa 1
- Criação do ambiente Linux.

### Etapa 2
- Instalação e configuração inicial do Git.

### Etapa 3
- Criação do repositório Git local.

### Etapa 4
- Criação do repositório GitHub.

### Etapa 5
- Primeiro commit do projeto.

### Etapa 6
- Organização da estrutura de diretórios.

### Etapa 7
- Criação do arquivo .gitignore.

### Etapa 8
- Instalação do Docker.

### Etapa 9
- Testes iniciais com containers Docker.

### Etapa 10
- Download do LocalStack.

### Etapa 11
- Estudo sobre LocalStack e integração com Terraform.

### Etapa 12
- Criação da estrutura inicial do projeto Terraform.
- Criação dos arquivos provider.tf, variables.tf e outputs.tf.

### Etapa 13
- Criação do README.md do projeto.
- Definição dos objetivos de aprendizado.

### Etapa 14
- Criação do repositório remoto no GitHub.
- Configuração do remote origin.

### Etapa 15
- Verificação dos containers Docker utilizando docker ps -a.
- Identificação de que não existem containers ativos ou cadastrados no ambiente.
- Conclusão de que será necessário criar um novo container LocalStack.

### Etapa 16

- Tentativa inicial de iniciar o LocalStack utilizando a imagem padrão.
- Identificação de erro relacionado à ativação de licença da versão Pro.
- Investigação através dos logs do container.
- Correção planejada utilizando uma versão Community estável.

### Etapa 17
- Download da versão Community do LocalStack (v3).
- Criação do container localstack.
- Exposição da porta 4566.
- Verificação de saúde do container (healthy).
- Validação dos logs do serviço.
- Confirmação da mensagem "Ready." indicando ambiente operacional.

### Observações

Durante este módulo aprendi:

- Conceitos básicos de Git.
- Versionamento de código.
- Estruturação de projetos.
- Conceitos iniciais de Docker.
- Diferenças entre AWS real e LocalStack.
- Organização de documentação técnica.
