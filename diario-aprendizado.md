### Etapa 1 - Variáveis

Foi criada a variável aws_region para definir a região AWS utilizada no projeto.

O uso de variáveis permite reutilização de código e facilita futuras alterações de configuração.

### Etapa 2 - Provider AWS

Foi configurado o provider AWS, responsável pela comunicação entre o Terraform e a conta AWS.

Também foi definida a versão mínima do Terraform e a versão do provider AWS utilizada pelo projeto.# Diário de Aprendizado

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
### Etapa 1 - Variáveis

Foi criada a variável aws_region para definir a região AWS utilizada no projeto.

O uso de variáveis permite reutilização de código e facilita futuras alterações de configuração.

### Etapa 2 - Provider AWS

Foi configurado o provider AWS, responsável pela comunicação entre o Terraform e a conta AWS.

Também foi definida a versão mínima do Terraform e a versão do provider AWS utilizada pelo projeto.
### Etapa 15
- Verificação dos containers Docker utilizando docker ps -a.
- Identificação de que não existem containers ativos ou cadastrados no ambiente.
- Conclusão de que será necessário criar um novo container LocalStack.

### Etapa 16
- Tentativa inicial de iniciar o LocalStack.
- Identificação de erro relacionado à imagem localstack-pro.
- Análise dos logs do container.
- Download da versão Community do LocalStack (v3).
- Criação do container localstack.
- Exposição da porta 4566.
- Verificação de saúde do container (healthy).
- Validação dos logs do serviço.
- Confirmação da mensagem "Ready." indicando ambiente operacional.

#### Aprendizado Técnico### Etapa 1 - Variáveis

Foi criada a variável aws_region para definir a região AWS utilizada no projeto.
O uso de variáveis permite reutilização de código e facilita futuras alterações de configuração.

### Etapa 2 - Provider AWS

Foi configurado o provider AWS, responsável pela comunicação entre o Terraform e a conta AWS.
Também foi definida a versão mínima do Terraform e a versão do provider AWS utilizada pelo projeto.### Etapa 1 - Variáveis
Foi criada a variável aws_region para definir a região AWS utilizada no projeto.
O uso de variáveis permite reutilização de código e facilita futuras alterações de configuração.

Foi necessário:

- Analisar os logs do container.
- Identificar o erro de licenciamento.
- Substituir pela versão Community.
- Validar o estado healthy do container.

Essa experiência reforçou a importância da análise de logs para resolução de problemas em ambientes Docker.

### Etapa 17
- Realização do teste de conectividade do LocalStack.
- Verificação do estado do container via Docker.
- Identificação de diferença entre o endpoint documentado e o endpoint da versão instalada.
- Validação do endpoint correto:
  - http://localhost:4566/_localstack/health
- Confirmação de funcionamento dos serviços simulados AWS.

#### Aprendizado Técnico

Durante os testes foi identificado que o endpoint `/health`
não retornava as informações esperadas na versão instalada.

Foi necessário consultar a estrutura da versão atual do
LocalStack e utilizar o endpoint:

http://localhost:4566/_localstack/health

Essa experiência demonstrou a importância de validar a
documentação utilizada e adaptar procedimentos conforme a
versão da ferramenta.

### Etapa 18
- Verificação da instalação do Terraform.
- Confirmação da versão instalada no ambiente.

### Etapa 19
- Configuração das credenciais AWS CLI.
- Validação da autenticação utilizando:
  aws sts get-caller-identity
- Confirmação de acesso à conta AWS através do usuário IAM terraform-user.

#### Aprendizado Técnico

A AWS CLI utiliza credenciais IAM para autenticação.

A validação através do comando `aws sts get-caller-identity`
permite confirmar que as credenciais configuradas estão válidas
e que o ambiente está apto para executar operações na AWS.

### Observações

Durante este módulo aprendi:

- Conceitos básicos de Git.
- Versionamento de código.
- Estruturação de projetos.
- Conceitos iniciais de Docker.
- Diferenças entre AWS real e LocalStack.
- Organização de documentação técnica.

## Módulo 2 - Criando o Projeto Terraform

### Como o Terraform funciona

Aprendi que o Terraform lê automaticamente todos os arquivos com extensão `.tf` presentes no diretório do projeto.

Isso permite organizar a infraestrutura em vários arquivos sem alterar o funcionamento da aplicação.

Exemplo:

- provider.tf → configuração do provider AWS
- variables.tf → definição de variáveis
- main.tf → recursos principais
- outputs.tf → saídas do projeto

Durante a execução, o Terraform interpreta todos esses arquivos como um único projeto.

### Etapa 1 - Variáveis

Foi criada a variável aws_region para definir a região AWS utilizada no projeto.

O uso de variáveis permite reutilização de código e facilita futuras alterações de configuração.

### Etapa 2 - Provider AWS

Foi configurado o provider AWS, responsável pela comunicação entre o Terraform e a conta AWS.

Também foi definida a versão mínima do Terraform e a versão do provider AWS utilizada pelo projeto.

### Etapa 3 - Inicialização do Terraform

Foi executado o comando `terraform init`, responsável por preparar o ambiente de trabalho do Terraform.

Durante essa etapa foram realizados:

- Download do provider AWS oficial da HashiCorp.
- Criação da pasta `.terraform`.
- Geração do arquivo `.terraform.lock.hcl`.
- Inicialização do projeto para futuras operações de provisionamento.

A inicialização foi concluída com sucesso, deixando o ambiente pronto para validação e planejamento da infraestrutura.

### Etapa 4 - Validação da Configuração

Foi executado o comando `terraform validate` para verificar a sintaxe e a consistência dos arquivos Terraform.

A validação foi concluída com sucesso, confirmando que a configuração do projeto está correta.

### Etapa 5 - Planejamento da Infraestrutura

Foi executado o comando `terraform plan`.

Como ainda não existem recursos definidos, o Terraform informou que não há alterações a serem aplicadas na infraestrutura.

---

#### Aprendizado Técnico

O comando `terraform plan` compara a configuração do projeto com o estado atual da infraestrutura e apresenta as alterações que serão realizadas antes da execução do `terraform apply`.

Esse comando é uma etapa importante para validar mudanças antes de provisionar recursos na AWS.

O comando `terraform init` deve ser executado sempre que um projeto Terraform é criado ou quando houver alteração de providers ou módulos.

Esse comando prepara o ambiente local antes da execução dos demais comandos do Terraform.

## Observações

Durante este módulo aprendi:

- Como o Terraform organiza os arquivos `.tf`.
- Como utilizar variáveis para tornar a infraestrutura reutilizável.
- Como configurar um provider.
- Como inicializar um projeto Terraform.

## Módulo 3 — Infraestrutura de Rede

### Objetivo

Neste módulo será criada toda a infraestrutura de rede da AWS, que servirá como base para os demais recursos do projeto.

A rede será composta por uma VPC, sub-redes públicas e privadas, Internet Gateway e tabelas de roteamento.

Essa organização segue boas práticas utilizadas em ambientes reais de produção.
