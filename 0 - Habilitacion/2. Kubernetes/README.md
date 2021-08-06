# Kubernetes con kubeadm

Guia para montar un clúster Kubernetes con máquinas virtuales para pruebas locales

## Pre-requisitos

Haber montado 2 máquinas virtuales con un minimo de:
* 2 GB de RAM
* 2 CPU core
* Distro Debian
* Conectados al mismo segmento de red o bien con ruteo activo (deben poder observarse una a otra)

# Controlplane Node

Uso de script:

```bash
sh k8s.sh
```

# Worker Node

Uso de script:

```bash
sh k8s.sh $hash_coneccion_controlplane
```

Luego de ejecutarse el script se puede probar el clúster con el siguiente comando (ya sea en el controlplane node o con tu binario kubetcl)

```bash
kubectl get nodes
```

Deberían estar todos en estado Ready