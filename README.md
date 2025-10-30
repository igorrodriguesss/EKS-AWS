# 🚀 EKS-AWS

Este repositório provisiona um cluster EKS completo na AWS utilizando Terraform, GitHub Actions e ArgoCD. A infraestrutura está dividida em etapas modulares para facilitar o deploy e manutenção.

---

## 📁 Estrutura do Projeto

- `00-remote-state-backend`: Configuração do backend remoto do Terraform (S3 + DynamoDB)
- `01-networking`: Provisionamento da infraestrutura de rede (VPC, subnets, gateways, rotas)
- `02-cluster-stack`: Criação do cluster EKS e recursos associados (node groups, IAM, SGs)
- `dvn-workshop-apps`: Aplicações de exemplo para deploy no cluster
- `.github/workflows`: Pipelines de CI/CD com GitHub Actions
- `images`: Diagramas e imagens ilustrativas da arquitetura

---

## ⚙️ Pré-requisitos

- AWS CLI configurado com credenciais válidas
- Terraform instalado (v1.3+ recomendado)
- Kubectl instalado e configurado
- Permissões adequadas na AWS para criar recursos

---

## 🚀 Como rodar o projeto

### 🔹 Etapa 1: Configurar o backend remoto (`00-remote-state-backend`)

1. Edite o arquivo `main.tf` com:
   - Nome do bucket S3
   - Nome da tabela DynamoDB
   - Região da AWS
  
2. Execute os comandos:
   ```bash
   cd 00-remote-state-backend
   terraform init
   terraform apply
   
### 🔹 Etapa 2: Provisionar a rede (01-networking)

1. Configure o arquivo variables.tf com os valores desejados:
   - CIDRs
   - Nome da VPC
   - Subnets
   - Region
   - NAT Gateway
   - Internet Gateway

2. Execute os comandos:
   ```bash
    cd ../01-networking
    terraform init
    terraform apply

### 🔹 Etapa 3: Criar o cluster EKS + Helm (02-cluster-stack)

1. Configure o arquivo variables.tf com os valores desejados:
   - Nome do cluster
   - Versão do cluster
   - Tipos de instância
   - Quantidade node groups
   - Versão Helm

2. Execute os comandos:
   ```bash
      cd ../02-cluster-stack
      terraform init
      terraform apply
--- 

### 📌 Observações
- O estado remoto precisa estar corretamente configurado antes de aplicar as demais etapas.
- Os módulos são independentes, mas seguem uma ordem lógica: backend → rede → cluster.
- Após o deploy do cluster, você pode configurar o ArgoCD para gerenciar os manifests de aplicações.
- Os pipelines em .github/workflows automatizam validações e deploys com GitHub Actions, ele está usando o repositório https://github.com/igorrodriguesss/EKS-AWS-GITOPS para puxar a aplicação.
