

## Kubernetes Architecture

k8s is a distributed architucture with master and worker nodes

Master Node has cluster master but looks as one single system.


What is kubernetes?
Kubernetes an open-source container orchestration platform designed to automate the deployment, management, and scaling of containerized applications.

Why to use kubernetes?
Docker can be used to create and manage containers, it lacks several features that Kubernetes provides for orchestrating those containers effectively:
    * Container Orchestration: 
        Docker does not have built-in orchestration capabilities like Kubernetes. 
        While Docker Swarm offers some orchestration features, it is less robust than Kubernetes.
    * Scaling and Load Balancing: 
        Kubernetes automatically scales applications based on traffic and load. 
        Docker requires additional tools or manual intervention to achieve similar functionality.
    * Service Discovery: 
       Kubernetes provides built-in service discovery mechanisms that allow containers to communicate with each other seamlessly. 
        Docker lacks this level of integration.
    * Health Monitoring: 
        Kubernetes continuously monitors the health of containers and can automatically restart or replace unhealthy instances. 
        Docker does not have this capability natively.

Kubernetes Architecture:
K8s is a Distributed system architucture.
It's a master and worker type

Master Node:
    * API Server (We communicate with api server)
    * etcd (executable directory/ database)
    * Controller manager()
    * Scheduler (Responsible for creating new work loads)

Node / Worker Node
     * Kubelet(is an agent that is responsible for executing commands sent from scheduler)
     * Container runtime(responsible for creating the container)
     * kube-proxy (responsible for network)

