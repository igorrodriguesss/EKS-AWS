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
# 🔄 Integração com GitOps – EKS-AWS-GITOPS

Este repositório faz parte do fluxo GitOps do projeto [EKS-AWS](https://github.com/igorrodriguesss/EKS-AWS) e é monitorado pelo ArgoCD para realizar o deploy contínuo das aplicações no cluster EKS.

## 📁 Estrutura do Repositório

- Armazena os **manifests Kubernetes** e **Helm charts** que o ArgoCD monitora
- Toda alteração neste repositório é automaticamente sincronizada com o cluster via ArgoCD
- Estrutura organizada por **ambientes** (ex: `dev`, `prod`) e por **aplicações**

## 🧭 Fluxo GitOps

1. O cluster EKS é provisionado via Terraform no repositório [EKS-AWS](https://github.com/igorrodriguesss/EKS-AWS)
2. O ArgoCD é instalado e configurado no cluster
3. O ArgoCD aponta para este repositório
   
---    

### 📌 Observações
- O estado remoto precisa estar corretamente configurado antes de aplicar as demais etapas.
- Os módulos são independentes, mas seguem uma ordem lógica: backend → rede → cluster.
- Após o deploy do cluster, você pode configurar o ArgoCD para gerenciar os manifests de aplicações.
- Os pipelines em .github/workflows automatizam validações e deploys com GitHub Actions, ele está usando o repositório https://github.com/igorrodriguesss/EKS-AWS-GITOPS para puxar a aplicação.
