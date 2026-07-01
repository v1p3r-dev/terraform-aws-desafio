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

```
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

---

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

---

# Módulo 5 — Banco de Dados

## Objetivo

Neste módulo iniciei a construção da camada de banco de dados da infraestrutura.

O foco desta etapa foi preparar todos os recursos necessários para que uma instância PostgreSQL possa ser provisionada futuramente de forma segura dentro da VPC criada nos módulos anteriores.

---

## DB Subnet Group

Foi criado o arquivo:

- `rds.tf`

Nesse arquivo foi configurado um DB Subnet Group utilizando as duas sub-redes privadas criadas durante a construção da infraestrutura de rede.

Essa configuração garante que o banco de dados permaneça isolado da Internet, permitindo sua implantação apenas em sub-redes privadas.

### Aprendizado

Aprendi que uma instância RDS não pode ser criada diretamente em qualquer subnet.

Antes disso, é necessário informar à AWS quais sub-redes poderão ser utilizadas através de um DB Subnet Group.

Também compreendi que manter o banco de dados em sub-redes privadas representa uma importante camada de segurança para a infraestrutura.

---

## Security Group do Banco de Dados

Ainda no arquivo `rds.tf` foi criado um Security Group exclusivo para o banco de dados.

Esse Security Group foi configurado para permitir conexões utilizando a porta padrão do PostgreSQL.

A regra de acesso foi definida para permitir apenas comunicações originadas da própria infraestrutura, evitando exposição desnecessária do banco de dados.

### Aprendizado

Compreendi que cada serviço da infraestrutura deve possuir regras de segurança próprias.

Separar os Security Groups facilita a manutenção do projeto e reduz os riscos de conceder permissões além do necessário.

Também entendi que um banco de dados não deve compartilhar as mesmas regras de acesso utilizadas por uma instância EC2.

---

## Estrutura da Instância RDS

Após preparar a infraestrutura de rede e segurança, foi criada a definição da futura instância RDS.

Durante essa etapa foram configurados os principais parâmetros necessários para o provisionamento do banco de dados, incluindo mecanismo utilizado, versão, armazenamento, classe da instância e integração com os recursos criados anteriormente.

A configuração também passou a utilizar referências para o DB Subnet Group e para o Security Group específico do banco.

### Aprendizado

Passei a compreender que uma instância RDS depende diretamente da infraestrutura criada anteriormente.

Antes de provisionar o banco é necessário preparar corretamente a rede, as sub-redes e as regras de segurança para que todos os recursos funcionem de forma integrada.

---

## Integração entre Recursos

Durante este módulo a infraestrutura passou a possuir mais dependências entre os recursos Terraform.

A configuração do banco passou a utilizar referências para componentes já existentes, como a VPC, as sub-redes privadas e o Security Group criado especificamente para o serviço.

Essa abordagem mantém o código organizado e permite que o Terraform identifique automaticamente a ordem correta de criação dos recursos.

### Aprendizado

Compreendi que uma das principais vantagens do Terraform é permitir que diferentes recursos sejam conectados por referências.

Isso reduz configurações manuais, evita inconsistências durante o provisionamento e torna o projeto mais organizado conforme sua complexidade aumenta.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

- funcionamento do Amazon RDS;
- finalidade do DB Subnet Group;
- utilização de sub-redes privadas para bancos de dados;
- criação de Security Groups específicos para o RDS;
- integração entre VPC, rede e banco de dados;
- dependências entre recursos Terraform.

---

# Módulo 6 — Armazenamento com Amazon S3

## Objetivo

Neste módulo iniciei a implementação da camada de armazenamento da infraestrutura utilizando o Amazon S3.

O objetivo desta etapa foi preparar um bucket que poderá ser utilizado futuramente por outros serviços da aplicação, seguindo boas práticas de organização e segurança.

---

## Bucket S3

Foi criado o arquivo:

- `s3.tf`

Nesse arquivo foi configurado o bucket principal do projeto.

As configurações realizadas foram:

- Nome definido utilizando a variável do projeto;
- Tags de identificação seguindo o padrão adotado;
- Estrutura preparada para integração com outros serviços da AWS.

### Aprendizado

Compreendi que o Amazon S3 é um serviço de armazenamento de objetos altamente escalável, utilizado para armazenar arquivos de diferentes tipos.

Também entendi que um bucket funciona como um contêiner onde os objetos são organizados e armazenados.

---

## Versionamento

Foi habilitado o versionamento do bucket.

Essa configuração permite manter diferentes versões de um mesmo arquivo sempre que ele for alterado.

### Aprendizado

Aprendi que o versionamento aumenta a segurança dos dados armazenados, permitindo recuperar versões anteriores de arquivos modificados ou excluídos.

Esse recurso é amplamente utilizado em ambientes de produção para evitar perda de informações.

---

## Criptografia

Foi configurada a criptografia padrão do bucket.

Com isso, todos os arquivos enviados para o S3 passam a ser armazenados automaticamente de forma criptografada.

### Aprendizado

Entendi que a criptografia protege os dados armazenados sem exigir alterações na aplicação que envia os arquivos.

Também compreendi que essa prática faz parte das recomendações de segurança da AWS.

---

## Bloqueio de Acesso Público

Foi configurado o bloqueio de acesso público do bucket.

Essa configuração impede que objetos sejam disponibilizados publicamente por configurações incorretas.

### Aprendizado

Aprendi que manter buckets privados é uma das principais boas práticas de segurança na AWS.

Também compreendi que essa configuração reduz significativamente o risco de exposição acidental de informações.

---

## Organização do Recurso

Durante a criação do bucket foi mantido o mesmo padrão utilizado nos módulos anteriores.

Foram utilizadas variáveis para definição do nome do recurso e tags para padronizar sua identificação dentro da infraestrutura.

### Aprendizado

Percebi que manter um padrão de nomenclatura facilita a manutenção do projeto e torna o código mais organizado à medida que novos recursos são adicionados.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

- funcionamento do Amazon S3;
- criação de buckets utilizando Terraform;
- versionamento de objetos;
- criptografia automática de arquivos;
- bloqueio de acesso público;
- boas práticas de armazenamento na AWS;
- padronização dos recursos utilizando variáveis e tags.

---

# Módulo 7 — Gerenciamento de Identidade e Acesso (IAM)

## Objetivo

Neste módulo iniciei a configuração do serviço de gerenciamento de identidades e permissões da infraestrutura utilizando o AWS Identity and Access Management (IAM).

O objetivo desta etapa foi permitir que a instância EC2 pudesse acessar recursos da AWS de forma segura, sem a necessidade de utilizar chaves de acesso diretamente na máquina.

---

## IAM Role

Foi criado o arquivo:

- `iam.tf`

Nesse arquivo foi definida uma IAM Role destinada à instância EC2.

As configurações realizadas foram:

- Criação da Role da EC2;
- Definição da Trust Policy;
- Permissão para o serviço EC2 assumir a Role;
- Aplicação de tags de identificação.

### Aprendizado

Compreendi que uma IAM Role representa um conjunto de permissões que pode ser utilizado temporariamente por um serviço da AWS.

Também entendi que a Trust Policy define quais serviços possuem autorização para assumir determinada Role.

---

## IAM Policy

Foi criada uma política personalizada contendo apenas as permissões necessárias para o projeto.

As permissões concedidas foram:

- Listagem do bucket S3;
- Leitura de objetos;
- Envio de objetos;
- Exclusão de objetos.

Todas as permissões foram limitadas exclusivamente ao bucket criado durante o módulo anterior.

### Aprendizado

Aprendi que uma Policy descreve exatamente quais ações um recurso pode executar dentro da AWS.

Também compreendi a importância de seguir o princípio do menor privilégio, concedendo apenas as permissões realmente necessárias para o funcionamento da aplicação.

---

## Associação da Policy

Após criar a Role e a Policy, foi realizada a associação entre ambas.

Dessa forma, todas as permissões definidas na Policy passaram a fazer parte da Role utilizada pela instância EC2.

### Aprendizado

Percebi que a criação da Policy não é suficiente para conceder permissões.

É necessário associá-la à Role para que essas permissões possam ser utilizadas pelos serviços autorizados.

---

## Instance Profile

Foi criado um Instance Profile responsável por vincular a IAM Role à instância EC2.

Essa configuração permite que a EC2 obtenha credenciais temporárias automaticamente durante sua execução.

### Aprendizado

Aprendi que uma instância EC2 não utiliza uma IAM Role diretamente.

A associação é realizada por meio de um Instance Profile, que funciona como um intermediário entre a instância e a Role criada.

---

## Integração com a EC2

Após concluir a configuração do IAM, a instância EC2 foi atualizada para utilizar o Instance Profile criado.

Com isso, a instância passou a possuir acesso ao bucket S3 sem armazenar credenciais estáticas dentro do sistema operacional.

### Aprendizado

Compreendi que utilizar IAM Roles aumenta significativamente a segurança da infraestrutura, eliminando a necessidade de armazenar Access Keys na instância.

Também percebi como o Terraform facilita a integração entre diferentes serviços da AWS por meio das referências entre recursos.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

- funcionamento do AWS IAM;
- criação de IAM Roles;
- configuração de Trust Policies;
- criação de Policies personalizadas;
- princípio do menor privilégio;
- associação entre Roles e Policies;
- utilização de Instance Profiles;
- integração entre IAM, EC2 e Amazon S3 utilizando Terraform.

---

# Módulo 8 — Computação Serverless

## Objetivo

Neste módulo iniciei a implementação da camada serverless da infraestrutura utilizando os serviços AWS Lambda e API Gateway.

O objetivo desta etapa foi preparar uma função capaz de executar código sob demanda e disponibilizá-la por meio de uma API HTTP, sem a necessidade de manter servidores dedicados em execução.

---

## AWS Lambda

Foi criado o arquivo:

- `lambda.tf`

Nesse arquivo foi definida a função Lambda responsável pelo processamento das requisições enviadas pela API.

As configurações realizadas foram:

- Criação da função Lambda;
- Definição do runtime da aplicação;
- Configuração do arquivo de implantação;
- Associação da IAM Role responsável pelas permissões da função;
- Aplicação de tags de identificação.

### Aprendizado

Compreendi que o AWS Lambda permite executar código em resposta a eventos sem a necessidade de administrar servidores.

Também entendi que a infraestrutura é provisionada automaticamente pela AWS, sendo necessário apenas definir a função e suas configurações.

---

## API Gateway

Foi criado o arquivo:

- `api.tf`

Nesse arquivo foi configurado o API Gateway responsável por disponibilizar um endpoint HTTP para comunicação com a função Lambda.

As configurações realizadas foram:

- Criação da API;
- Configuração dos recursos e métodos HTTP;
- Integração entre API Gateway e Lambda;
- Estrutura preparada para futuras expansões da aplicação.

### Aprendizado

Aprendi que o API Gateway funciona como a porta de entrada para aplicações serverless.

Também compreendi que ele é responsável por receber as requisições dos clientes, encaminhá-las para a função Lambda e retornar a resposta ao usuário.

---

## Integração entre API Gateway e Lambda

Após criar ambos os recursos, foi realizada a integração entre a API e a função Lambda.

Essa configuração permite que toda requisição recebida pelo endpoint seja encaminhada automaticamente para execução da função.

### Aprendizado

Percebi que a integração entre serviços é um dos principais pontos fortes da AWS.

Utilizando o Terraform, essa comunicação é estabelecida por meio das referências entre recursos, tornando a infraestrutura organizada e de fácil manutenção.

---

## Organização da Infraestrutura

Durante o desenvolvimento deste módulo foi mantido o mesmo padrão utilizado em todo o projeto.

Cada serviço permaneceu em seu próprio arquivo Terraform, facilitando a organização, manutenção e expansão futura da infraestrutura.

### Aprendizado

Compreendi que dividir a infraestrutura em arquivos específicos torna o projeto mais legível e facilita o gerenciamento de ambientes maiores.

Também percebi que essa organização reduz a complexidade conforme novos serviços são adicionados.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

- funcionamento do AWS Lambda;
- conceito de computação serverless;
- criação de funções Lambda utilizando Terraform;
- funcionamento do API Gateway;
- integração entre API Gateway e Lambda;
- comunicação entre serviços da AWS;
- organização de infraestruturas Terraform em múltiplos arquivos.

---


---

# Módulo 9 — Escalabilidade e Balanceamento de Carga

## Objetivo

Neste módulo foi implementada a camada responsável pela alta disponibilidade da aplicação utilizando Application Load Balancer (ALB) e Auto Scaling Group (ASG).

O objetivo foi permitir que a aplicação pudesse distribuir o tráfego entre múltiplas instâncias EC2 e aumentar ou reduzir automaticamente a quantidade de servidores conforme a demanda.

---

## Launch Template

Foi criada uma Launch Template contendo a configuração padrão utilizada pelas instâncias EC2 do Auto Scaling Group.

As configurações definidas incluem:

- AMI obtida dinamicamente através de Data Source;
- Tipo da instância definido por variável;
- Security Group da aplicação;
- IAM Instance Profile;
- Key Pair;
- User Data para instalação automática do Apache HTTP Server;
- Tags padronizadas.

### Aprendizado

Aprendi que o Launch Template funciona como um modelo reutilizável para criação de novas instâncias EC2.

Sempre que o Auto Scaling Group precisar criar uma nova máquina, utilizará automaticamente essa configuração, garantindo padronização em toda a infraestrutura.

---

## Auto Scaling Group

Foi criado o Auto Scaling Group responsável pelo gerenciamento automático das instâncias EC2.

As configurações realizadas foram:

- Capacidade mínima;
- Capacidade desejada;
- Capacidade máxima;
- Associação às sub-redes públicas;
- Integração com o Target Group do Load Balancer.

### Aprendizado

Compreendi que o Auto Scaling Group permite manter a disponibilidade da aplicação mesmo em caso de falhas nas instâncias.

Também aprendi que novas máquinas podem ser criadas automaticamente sempre que houver necessidade.

---

## Política de Escalabilidade

Foi criada uma política baseada na utilização média da CPU.

A política foi configurada utilizando Target Tracking Scaling.

Com isso, a infraestrutura poderá:

- aumentar automaticamente a quantidade de instâncias quando a utilização da CPU crescer;
- reduzir automaticamente a quantidade de instâncias quando a utilização diminuir.

### Aprendizado

Aprendi que o Auto Scaling trabalha em conjunto com métricas do CloudWatch para tomar decisões automaticamente.

Esse mecanismo aumenta a disponibilidade da aplicação e contribui para reduzir custos.

---

## Application Load Balancer

Foi criado um Application Load Balancer (ALB) responsável por distribuir o tráfego entre as instâncias EC2.

Também foram configurados:

- Target Group;
- Listener HTTP;
- Associação do Auto Scaling Group ao Target Group.

### Aprendizado

Compreendi que o Load Balancer distribui automaticamente as requisições recebidas entre todas as instâncias disponíveis.

Também entendi que essa arquitetura evita sobrecarga em um único servidor e melhora a disponibilidade da aplicação.

---

## Conclusão

Ao concluir este módulo passei a compreender melhor:

- funcionamento do Launch Template;
- criação de Auto Scaling Groups;
- políticas de escalabilidade automática;
- integração entre ALB e EC2;
- balanceamento de carga;
- alta disponibilidade utilizando Terraform.

---

# Módulo 10 — Provisionamento Completo da Infraestrutura

## Objetivo

Neste módulo foi realizado o provisionamento completo da infraestrutura criada durante todo o projeto utilizando Terraform.

Essa etapa permitiu validar a integração entre todos os recursos desenvolvidos ao longo da jornada.

---

## Terraform Apply

Foi executado o comando:

```bash
terraform apply
```

Durante esse processo foram provisionados diversos recursos da infraestrutura, incluindo:

- VPC;
- Sub-redes públicas;
- Sub-redes privadas;
- Internet Gateway;
- NAT Gateway;
- Route Tables;
- Security Groups;
- EC2;
- Launch Template;
- Auto Scaling Group;
- Application Load Balancer;
- Amazon S3;
- DynamoDB;
- IAM Roles;
- IAM Policies;
- AWS Lambda;
- API Gateway;
- DB Subnet Group.

### Aprendizado

Compreendi como o Terraform resolve automaticamente as dependências entre recursos, criando cada serviço na ordem correta.

Também foi possível visualizar como diversos serviços da AWS trabalham de forma integrada para compor uma infraestrutura completa.

---

## Problemas Encontrados

Durante o provisionamento foram encontrados alguns erros reais da AWS.

Esses problemas contribuíram significativamente para o aprendizado do funcionamento dos serviços.

---

### Backup Retention do Amazon RDS

Inicialmente ocorreu um erro relacionado ao período de retenção de backups do banco de dados PostgreSQL.

Após análise da documentação e da mensagem retornada pela AWS, foi identificado que a conta utilizada possuía limitações relacionadas ao plano gratuito.

Foi realizada a alteração da configuração para:

```terraform
backup_retention_period = 0
```

### Aprendizado

Compreendi que algumas funcionalidades disponíveis na documentação podem sofrer limitações dependendo do tipo de conta utilizada na AWS.

Também aprendi a interpretar mensagens de erro retornadas pelo serviço RDS.

---

### Versão do PostgreSQL

Após corrigir o problema anterior surgiu um novo erro:

```text
Cannot find version 15.4 for postgres
```

A investigação mostrou que a versão especificada não estava disponível para a região utilizada.

Foi necessário atualizar a configuração para utilizar uma versão suportada pelo serviço.

### Aprendizado

Aprendi que versões específicas dos serviços AWS podem variar conforme a região.

Também compreendi a importância de consultar a documentação oficial antes de definir versões fixas dos recursos.

---

## Organização da Infraestrutura

Durante todo o desenvolvimento foi mantida uma organização baseada em arquivos separados por responsabilidade.

Cada serviço permaneceu em seu próprio arquivo Terraform.

Essa organização tornou o projeto mais simples de manter, facilitando futuras alterações e expansões da infraestrutura.

### Aprendizado

Percebi que dividir a infraestrutura em módulos lógicos melhora significativamente a leitura do código e facilita a manutenção do projeto.

---

## Versionamento

Durante toda a construção da infraestrutura foram realizados commits frequentes utilizando Git.

Também foram realizadas atualizações constantes no README e neste Diário de Aprendizado.

### Aprendizado

Compreendi que documentar a evolução do projeto é tão importante quanto desenvolver a infraestrutura.

Essa prática facilita futuras consultas e demonstra claramente a evolução do aprendizado ao longo do desafio.

---

# Lições Aprendidas

Ao longo deste projeto consolidei conhecimentos importantes sobre Infrastructure as Code utilizando Terraform.

Além da criação dos recursos, aprendi a interpretar mensagens de erro, identificar dependências entre serviços, consultar a documentação oficial da AWS e corrigir problemas reais encontrados durante o provisionamento.

Também desenvolvi maior familiaridade com o fluxo de trabalho utilizando Git e GitHub, registrando a evolução do projeto por meio de commits frequentes e documentação contínua.

Ao concluir este desafio foi possível compreender como diferentes serviços da AWS trabalham em conjunto para formar uma infraestrutura moderna, organizada, escalável e automatizada.
