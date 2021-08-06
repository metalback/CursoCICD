#!/bin/bash
# author: Mauricio Beltrán <mgbeltranb@gmail.com>
# preface: Script para levantar un cluster de kubernetes con 2 maquinas virtuales

# Obtener IP de las maquinas virtuales
read -p "Enter controlplane IP : " CONTROLPLANE_IP
read -p "Enter worker IP : " WORKER_IP

# Probar conectividad de las maquinas


# verificar requisitos basicos de las maquinas
# scp remote/stats.sh root@$CONTROLPLANE_IP:/root/
scp remote/stats.sh root@$WORKER_IP:/root/
# scp remote/controlplane.sh root@$CONTROLPLANE_IP:/root/

# ssh -l root $CONTROLPLANE_IP "sh stats.sh"
# ssh -l root $CONTROLPLANE_IP "cat /root/cpu"
# ssh -l root $CONTROLPLANE_IP "cat /root/mem"

# CONTROLPLANE_CPU=$(ssh -l root $CONTROLPLANE_IP "cat cpu")
# CONTROLPLANE_RAM=$(ssh -l root $CONTROLPLANE_IP "cat mem")

# Construir controlplane y esperar hash
# ssh -l root $CONTROLPLANE_IP "sh controlplane.sh"

CONNECTION_STRING=$(ssh -l root $CONTROLPLANE_IP "kubeadm token create --print-join-command")
# Construir worker node y agregarlo al cluster
scp remote/worker.sh root@$WORKER_IP:/root/
ssh -l root $WORKER_IP "sh worker.sh"
ssh -l root $WORKER_IP "$CONNECTION_STRING"

# Instalar calico
ssh -l root $CONTROLPLANE_IP "kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml"

# Habilitar kubectl de manera local
echo "Puedes agregar el config siguiente a tu config local en .kube/config"
ssh -l root $CONTROLPLANE_IP "cat .kube/config"