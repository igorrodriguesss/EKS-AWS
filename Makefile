# Diretórios
BACKEND_DIR=00-remote-state-backend
NETWORKING_DIR=01-networking
CLUSTER_DIR=02-cluster-stack

# Comando padrão
all: backend networking cluster

# Inicializa e aplica o backend
backend:
	cd $(BACKEND_DIR) && terraform init -input=false && terraform apply -auto-approve

# Inicializa e aplica a infraestrutura de rede
networking:
	cd $(NETWORKING_DIR) && terraform init -input=false && terraform apply -auto-approve

# Inicializa e aplica o cluster EKS
cluster:
	cd $(CLUSTER_DIR) && terraform init -input=false && terraform apply -auto-approve
