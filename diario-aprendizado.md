# Diário de Aprendizado

## Objetivo

Este documento registra minha evolução durante o desenvolvimento do projeto Terraform AWS Challenge.

Além de documentar as atividades realizadas, também descreve os conceitos estudados, dificuldades encontradas e os conhecimentos adquiridos em cada etapa do projeto.

---

# Módulo 1 — Preparação do Ambiente

## Configuração do ambiente

Nesta primeira etapa preparei todo o ambiente necessário para iniciar o desenvolvimento do projeto.

Foram realizadas as seguintes atividades:

- Configuração do ambiente Linux;
- Instalação do Git;
- Criação do repositório local;
- Criação do repositório no GitHub;
- Configuração do repositório remoto (origin);
- Primeiro commit do projeto;
- Organização da estrutura inicial de diretórios;
- Criação do arquivo `.gitignore`.

### Aprendizado

Foi possível entender o fluxo básico de versionamento utilizando Git e GitHub, além da importância de manter o projeto organizado desde o início.

---

## Docker e LocalStack

Nesta etapa foi preparado o ambiente que simula os serviços da AWS.

Foram realizadas as seguintes atividades:

- Instalação do Docker;
- Testes iniciais com containers;
- Download do LocalStack;
- Identificação de erro relacionado ao licenciamento;
- Consulta aos logs do container;
- Criação do container LocalStack;
- Exposição da porta 4566;
- Validação do Health Check.

Também foi realizada a verificação do endpoint correto da versão instalada:

```
http://localhost:4566/_localstack/health
```

### Aprendizado

Durante essa etapa aprendi que consultar os logs é uma das formas mais eficientes de identificar problemas em containers.

Também entendi que a documentação pode variar conforme a versão da ferramenta utilizada.

---

## AWS CLI

Após configurar o ambiente local, realizei a configuração da AWS CLI.

As atividades foram:

- Configuração das credenciais IAM;
- Validação da autenticação utilizando:

```
aws sts get-caller-identity
```

### Aprendizado

Esse teste confirmou que as credenciais estavam corretas e que o ambiente estava preparado para futuras operações na AWS.

---

# Módulo 2 — Estrutura Inicial do Terraform

## Organização do projeto

Foi criada a estrutura básica do projeto Terraform.

Arquivos criados:

- provider.tf
- variables.tf
- outputs.tf
- README.md

Também foi criada a estrutura inicial do projeto para facilitar sua manutenção conforme novos recursos forem adicionados.

---

## Como o Terraform organiza os arquivos

Uma das primeiras dúvidas que surgiu foi como o Terraform interpreta vários arquivos `.tf`.

Aprendi que todos os arquivos presentes no diretório do projeto são carregados automaticamente durante a execução.

Ou seja, não importa se existem:

- provider.tf
- variables.tf
- vpc.tf
- subnet.tf
- nat.tf

Todos fazem parte do mesmo projeto Terraform.

Essa organização facilita bastante a separação dos recursos por responsabilidade.

---

## Variáveis

Foram criadas as primeiras variáveis do projeto:

- Região AWS;
- Nome do projeto.

Posteriormente também foram adicionadas as variáveis responsáveis pelos blocos CIDR da VPC e das sub-redes.

### Aprendizado

O uso de variáveis evita repetir valores dentro do código e facilita futuras alterações.

---

## Provider AWS

Foi configurado o provider AWS.

Também foi definida a versão mínima do Terraform utilizada pelo projeto.

### Aprendizado

O provider funciona como a ponte entre o Terraform e a infraestrutura que será provisionada.

---

## Inicialização do projeto

Foi executado:

```
terraform init
```

Essa etapa realizou:

- Download do provider AWS;
- Criação da pasta `.terraform`;
- Geração do arquivo `.terraform.lock.hcl`.

---

## Validação

Após criar os arquivos iniciais foi executado:

```
terraform validate
```

O Terraform confirmou que a configuração estava consistente.

---

## Planejamento

Também foi utilizado:

```
terraform plan
```

Nesse momento ainda não existiam recursos para criar, portanto nenhuma alteração foi planejada.

### Aprendizado

Passei a entender a diferença entre os três principais comandos do Terraform:

- `terraform init` prepara o ambiente;
- `terraform validate` verifica a sintaxe;
- `terraform plan` mostra tudo o que será criado antes da aplicação.

---

# Módulo 3 — Infraestrutura de Rede

## Objetivo

Neste módulo começou a construção da infraestrutura de rede que servirá de base para todo o restante do projeto.

---

## Virtual Private Cloud (VPC)

Foi criada a VPC principal da aplicação.

Configurações implementadas:

- Bloco CIDR da rede;
- Suporte a DNS;
- Hostnames habilitados;
- Tag Name.

### Aprendizado

A VPC representa a rede privada onde todos os demais recursos da AWS serão criados.

---

## Sub-redes

Foram criadas quatro sub-redes:

- Public Subnet 1;
- Public Subnet 2;
- Private Subnet 1;
- Private Subnet 2.

Cada subnet recebeu:

- CIDR próprio;
- Zona de disponibilidade;
- Tags;
- Configuração de IP público apenas nas sub-redes públicas.

### Aprendizado

Passei a compreender a diferença entre sub-redes públicas e privadas.

Também entendi a importância de distribuir recursos entre diferentes Availability Zones para aumentar a disponibilidade da aplicação.

---

## Internet Gateway

Foi criado um Internet Gateway associado à VPC.

Sua função será permitir que as sub-redes públicas tenham acesso à Internet.

### Aprendizado

Sem um Internet Gateway, mesmo uma subnet pública não consegue se comunicar com a Internet.

---

## Elastic IP

Foi criado um Elastic IP.

Esse endereço IP público será utilizado posteriormente pelo NAT Gateway.

### Aprendizado

O NAT Gateway precisa de um endereço IP público fixo para encaminhar o tráfego das instâncias privadas.

---

## NAT Gateway

Foi criado o NAT Gateway.

Ele será responsável por permitir que recursos localizados nas sub-redes privadas acessem a Internet sem ficarem expostos publicamente.

Durante essa etapa também utilizei o atributo:

```
depends_on
```

para garantir que o Internet Gateway seja criado antes do Elastic IP.
---

## Tabelas de Roteamento

Foram criadas duas tabelas de rotas:

- Tabela pública;
- Tabela privada.

Na tabela pública foi adicionada uma rota padrão apontando para o Internet Gateway.

Na tabela privada foi adicionada uma rota padrão apontando para o NAT Gateway.

### Aprendizado

Compreendi que criar uma Route Table não significa que ela já possui rotas configuradas.

Foi necessário criar explicitamente as rotas utilizando o recurso `aws_route`.

---

## Associação das Sub-redes

As sub-redes públicas foram associadas à tabela pública.

As sub-redes privadas foram associadas à tabela privada.

### Aprendizado

Aprendi que as tabelas de roteamento só entram em funcionamento depois que são associadas às sub-redes.

Sem essa associação, a subnet continua utilizando a tabela principal da VPC.

Entendi que o Terraform normalmente identifica dependências automaticamente, mas em alguns cenários é necessário defini-las manualmente.

Passei a compreender a importância de registrar pequenas evoluções do projeto por meio de commits descritivos.

Isso facilita tanto a organização quanto a consulta ao histórico de desenvolvimento.

---

# Módulo 4 — Camada de Computação

## Objetivo

Neste módulo iniciei a camada de computação da infraestrutura, criando os recursos necessários para provisionar a primeira instância EC2 do projeto.

Além da configuração da instância, também foram implementados os mecanismos responsáveis pelo controle de acesso e pela definição da imagem utilizada no provisionamento.

---

## Security Group

Foi criado um Security Group específico para a instância EC2.

As configurações realizadas foram:

* Associação à VPC criada anteriormente;
* Regra de entrada permitindo conexões SSH (porta 22);
* Regra de saída liberando o tráfego para qualquer destino;
* Tags de identificação seguindo o padrão adotado no projeto.

### Comandos utilizados

Após concluir essa etapa foram executados os comandos:

```bash
terraform fmt
terraform validate
terraform plan
```

### Aprendizado

Compreendi que o Security Group funciona como um firewall virtual da AWS.

Enquanto as regras de entrada controlam quais conexões podem acessar a instância, as regras de saída definem para quais destinos ela poderá se comunicar.

---

## Data Source da AMI

Foi criado o arquivo:

* `data.tf`

Nesse arquivo foi configurado um Data Source responsável por localizar automaticamente a versão mais recente da imagem Amazon Linux 2023.

Essa abordagem elimina a necessidade de utilizar IDs fixos de AMIs, tornando o projeto mais flexível e reduzindo a necessidade de manutenção futura.

### Comandos utilizados

```bash
terraform fmt
terraform validate
terraform plan
```

### Aprendizado

Aprendi a diferença entre recursos (`resource`) e fontes de dados (`data`).

Enquanto um recurso cria infraestrutura, um Data Source apenas consulta informações já existentes na AWS para serem utilizadas durante o provisionamento.

---

## Configuração da EC2

Foi criado o arquivo:

* `ec2.tf`

A instância EC2 foi configurada utilizando:

* AMI obtida por meio do Data Source;
* Tipo da instância definido por variável;
* Sub-rede pública;
* Security Group criado anteriormente;
* Endereço IP público;
* Tags de identificação.

Também foi configurado um Key Pair para permitir o acesso remoto via SSH.

### Comandos utilizados

```bash
terraform fmt
terraform validate
terraform plan
```

Ao final da configuração, o Terraform apresentou:

```text
Plan: 19 to add, 0 to change, 0 to destroy.
```

confirmando que todos os recursos estavam corretamente definidos.

### Aprendizado

Durante essa etapa compreendi que a criação de uma instância EC2 depende diretamente da infraestrutura construída nos módulos anteriores.

A EC2 utiliza referências para recursos como VPC, sub-redes, Security Group e Key Pair, demonstrando como o Terraform estabelece automaticamente as dependências entre os componentes da infraestrutura.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

* funcionamento dos Security Groups;
* diferença entre regras Ingress e Egress;
* utilização de Data Sources;
* busca dinâmica de AMIs;
* configuração de Key Pairs;
* provisionamento de instâncias EC2;
* dependências entre recursos Terraform.
