

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

![Kubernetes Architecture](../images/Kubernetes_1.webp)  
<img src="../images/kubernetes_1.webp" height="200">  

</br>
Master Node:
    * API Server (We communicate with api server)
    * etcd (executable directory/ database)
    * Controller manager()
    * Scheduler (Responsible for creating new work loads)

Node / Worker Node
     * Kubelet(is an agent that is responsible for executing commands sent from scheduler)
     * Container runtime(responsible for creating the container)
     * kube-proxy (responsible for network)


Ways to handle Containers in Kubernetes


Kubernetes Workload:
	What all we can do in Kubernetes.



## Pod
A pod is the smallest unit of computing that can be deployed and managed in Kubernetes.
A pod has one or more container in it.
Every pod gets its own ipAddress.


K8s setup

CRI - container runtime interface
CNI
CSI 
  
## Manual Steps for understanding k8s working  
- First we need to have 1 system for Master and others for Nodes (Pods)  
1. Install docker in all machines.
2. install cri-dockerd in master machine.
	* CRI-Dockerd serves as an open-source adapter that allows Docker Engine to interface with Kubernetes through the Container Runtime Interface (CRI).
	* [CRI-dockerd releases page](https://github.com/Mirantis/cri-dockerd/releases)
3. We now install kubeadm, kubectl and kubelet on all nodes
4. 




Kubernetes Major workloads:
* Pod
	* Pods will have containers
* Controllers:
	

K8s Manifest:
Writing a pod file in yaml:

---
apiVersion: v1
kind: Pod
metadata:
  name: hello-pod
spec:
  Container:
    - image: nginx:1.27 

We execute this above manifest with **"kubectl apply -f filename"**
We can run **"kubectl get pods"**
**kubectl get pods  -o wide** to view more information about the pods.


For all the resources we use **kubectl api-resources**

**kubectl exec podname -- printenv**  to display the environment variables 
**kubectl exec podname -- /bin/sh** tp execute commands inside the container.
**kubectk exec -c containerName podname -- printenv** to print the env variables of specified pod

## Adding labels
we provide labels in meta data.
ex: 
metadata:
  label:
    env: dev
    release: 3.4

for viewing these lables we can execute command **"kubectl get po --show-labels"** 

to get all the pods with env dev
	* kubectl get po -l env=dev

## ReplicaSets
* 



## Service
Service is a k8s object that creates virtual Ip-address and DNS Name is fixed. 
It requires KubeProxy and core DNS.
Types: 
	Cluster IP
	NodePort
	Load Balancer
	ExternalName

## Managed Kubernetes Cluster:
* Cloud providers offer manage Kubernetes cluster.
* 

## Config Maps:
* If we want to pass the key value pair data to pods that is inSensitive we use **ConfigMaps**.
For this we create a new **yaml file** and then refer the file in file in which we need value
The value of the config map cannot be changed.


HelthCheck for application:
Liveness Probe
Readness Peobe
startup Probe

Deployement:
* ConfigMaps
* Secrets

Demonsets: A DaemonSet is a specialized Kubernetes resource designed to ensure that a specific Pod runs on all or a selected subset of nodes within a cluster. 
This functionality is particularly useful for deploying background services that need to operate across the entire cluster, such as logging agents, monitoring tools, and network proxies.

	Uses:	Logging and Monitoring:
		Cluster Storage Management:
		Network Services:

Jobs: 
* A Kubernetes Job is a resource designed to manage the execution of short-lived tasks within a Kubernetes cluster.
* It ensures that a specified number of Pods successfully complete their tasks before the Job itself is considered complete. 
* This functionality is particularly useful for running batch processes, data processing, and other one-time tasks that do not require continuous operation.

CronJobs:

NameSpace:
In Kubernetes, a namespace is a mechanism for isolating groups of resources within a single cluster. 
It allows for the logical organization and management of resources, making it easier to handle multiple projects or teams that share the same cluster. 


Persistent Volumes: refer 25-11-24
Persistent Volumes (PVs) are a crucial component of Kubernetes, designed to provide durable storage for containerized applications. 
Unlike regular volumes that are tied to the lifecycle of a pod, PVs exist independently and retain data even when pods are terminated or restarted. 
This capability is essential for stateful applications, such as databases, where data consistency and persistence are critical.

Modes in PV:
Retain, Delete, Recycle

Access modes:
4 modes.

Kubernetes Client:
Lens.




























