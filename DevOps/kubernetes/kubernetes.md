# What is Kubernetes?
Kubernetes is an open-source container orchestration platform designed to automate the deployment, management, and scaling of containerized applications.

## What is an Orchestration Platform?
An orchestration platform is a system designed to automate and coordinate complex processes across multiple services, applications, or systems.  
It serves as a centralized interface that manages workflows, ensuring that various tasks and components work together seamlessly to achieve specific business outcomes.

### Why use Kubernetes?
Docker can be used to create and manage containers, but it lacks several features that Kubernetes provides for orchestrating those containers effectively:  
* #### Container Orchestration: 
    Docker does not have built-in orchestration capabilities like Kubernetes.   
    While Docker Swarm offers some orchestration features, it is less robust than Kubernetes.  
* #### Scaling and Load Balancing: 
    Kubernetes automatically scales applications based on traffic and load. 
    Docker requires additional tools or manual intervention to achieve similar functionality.
* #### Service Discovery: 
    Kubernetes provides built-in service discovery mechanisms that allow containers to communicate with each other seamlessly. 
    Docker lacks this level of integration.
* #### Health Monitoring: 
    Kubernetes continuously monitors the health of containers and can automatically restart or replace unhealthy instances. 
    Docker does not have this capability natively.

### Kubernetes Architecture:
Kubernetes architecture is designed to manage containerized applications across a distributed system, consisting of a control plane and worker nodes.  

<img src="./images/kubernetes_1.webp" height="200">  

* #### Master Node:  
    * API Server (User communicates with API server)
    * etcd (executable directory/ database)
    * Controller manager()
    * Scheduler (Responsible for creating new work-loads/Container)

* #### Node / Worker Node
     * Kubele (An agent responsible for executing commands sent from the scheduler)
     * Container runtime(responsible for creating the container)
     * kube-proxy (responsible for network)


## Ways to handle Containers in Kubernetes:

1. #### Use of Pods:  
Definition: Pods are the smallest deployable units in Kubernetes, which can contain one or more containers that share the same network namespace and storage.  
Best Practice: Keep pods focused on a single responsibility to enhance modularity and scalability. Use multi-container pods sparingly for tightly coupled components that need to share resources.  

2. #### Deployment Management:  
Declarative Configuration: Define the desired state of applications using YAML files or Helm charts.  
This includes specifying the container images, resource requirements, and replica counts.  
Rolling Updates: Utilize Kubernetes' built-in capabilities for rolling updates to deploy new versions of applications without downtime, ensuring high availability during transitions14.

3. #### Scaling Applications
Horizontal Pod Autoscaler: Automatically scale the number of pod replicas based on CPU utilization or other select metrics. This allows applications to respond dynamically to varying loads45.
Manual Scaling: Adjust the number of replicas manually through deployment configurations when predictable changes in load occur.

4. #### Resource Management
Requests and Limits: Specify CPU and memory requests and limits for each container to ensure fair resource allocation and prevent resource contention among containers.
Node Affinity and Taints: Use node affinity rules and taints/tolerations to control where pods are scheduled based on resource availability and specific requirements.

5. #### Networking
Services: Create services to expose pods internally or externally, enabling load balancing and service discovery within the cluster13.
Network Policies: Implement network policies to control traffic flow between pods, enhancing security by limiting communication-based on defined rules.

6. #### Storage Management
Persistent Volumes (PVs) and Persistent Volume Claims (PVCs): Use PVs for durable storage solutions that outlive pod lifecycles, allowing stateful applications (like databases) to maintain data integrity across restarts25.
Dynamic Provisioning: Configure storage classes for dynamic provisioning of volumes based on application needs.

7. #### Monitoring and Logging
Monitoring Tools: Integrate monitoring solutions like Prometheus or Grafana to track performance metrics, resource usage, and application health in real-time45.
Logging Solutions: Use centralized logging systems (like ELK stack) to collect logs from all containers for easier troubleshooting and analysis.

8. #### Security Practices
Role-Based Access Control (RBAC): Implement RBAC to manage permissions for users and services within the cluster, ensuring that only authorized entities can perform actions on resources13.
Pod Security Policies: Enforce policies that define security contexts for pods, such as restricting privileged access or controlling volume types.  

### Kubernetes Workloads:
* A workload is an application running on Kubernetes. Whether your workload is a single component or several that work together, on Kubernetes you run it inside a set of pods. In Kubernetes, a Pod represents a set of running containers on your cluster.

1. Deployments
2. StatefulSets
3. Scaling Applications
4. Resource Management
5. Networking
6. Storage Management
7. Monitoring and Logging
8. Security Practices


### K8s Interfaces
CRI - container runtime interface  
CNI - container network interface  
CSI - container storage interface  
  

## Manual Steps for understanding k8s working  
- First, we need to have 1 system for the Master and others for Nodes (Pods)  
1. Install docker in all machines.
2. install cri-dockerd in master machine.
	* CRI-Dockerd serves as an open-source adapter that allows Docker Engine to interface with Kubernetes through the Container Runtime Interface (CRI).
	* [CRI-dockerd releases page](https://github.com/Mirantis/cri-dockerd/releases)
3. We now install kubeadm, kubectl, and kubelet on all nodes
4. 


<br><br><br>

## Kubernetes Major workloads:
* Pod
	* Pods will have containers
* Controllers:
	

### K8s Manifest:
A Kubernetes manifest file is a configuration file used to define the desired state of Kubernetes objects, such as Pods, Deployments, Services, and more.   
These files are typically written in YAML or JSON format and serve as the primary means to manage and deploy applications within a Kubernetes cluster.

- Key Features of Kubernetes Manifest Files:  
#### Declarative Configuration: 
Manifest files allow users to declare the desired state of their applications. When applied, Kubernetes reconciles the current state of the cluster with the desired state specified in the manifest.
#### Version Control: 
By using manifest files, configurations can be versioned alongside application code, facilitating collaboration and change tracking.
#### Multiple Object Definitions: 
A single manifest file can define multiple Kubernetes objects by separating them with ---. This allows for organized and efficient management of related resources.
#### Readability: 
YAML format is preferred for its readability, making it easier for teams to collaborate on complex configurations.

### Structure of a Manifest File
A typical Kubernetes manifest includes several key sections:
* apiVersion: Specifies the version of the Kubernetes API that the object uses.
* kind: Defines the type of resource being created (e.g., Pod, Deployment).
* metadata: Contains metadata about the object, such as its name and labels.
* spec: Describes the desired state and configuration details of the resource.

#### Example Manifest File

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

---

We execute this above manifest with **"kubectl apply -f filename"**  
We can run **"kubectl get pods"**  
**kubectl get pods  -o wide** to view more information about the pods.  
  

For all the resources we use **kubectl api-resources**  

**kubectl exec podname -- printenv**  to display the environment variables   
**kubectl exec podname -- /bin/sh** tp execute commands inside the container.  
**kubectk exec -c containerName podname -- printenv** to print the env variables of specified pod  

## Adding labels
we provide labels in meta-data.
Ex: 
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
Service is a k8s object that creates a virtual IP-Address and the DNS Name is fixed. 
It requires KubeProxy and core DNS.
Types: 
	Cluster IP
	NodePort
	Load Balancer
	ExternalName

## Managed Kubernetes Cluster:
* Cloud providers offer to manage Kubernetes clusters.
* 

## Config Maps:
* If we want to pass the key-value pair data to pods that are inSensitive we use **ConfigMaps**.
For this we create a new **yaml file** and then refer to the file in a file in which we need value.
The value of the config map cannot be changed.


### HelthCheck for application:
* Liveness Probe
* Readiness Probe
* startup Probe

Deployment:
* ConfigMaps
* Secrets

## Demonsets: 
A DaemonSet is a specialized Kubernetes resource designed to ensure that a specific Pod runs on all or a selected subset of nodes within a cluster.   
This functionality is particularly useful for deploying background services that need to operate across the entire cluster, such as logging agents, monitoring tools, and network proxies.  

Uses: Logging and Monitoring:
	Cluster Storage Management:
	Network Services:

Jobs: 
* A Kubernetes Job is a resource designed to manage the execution of short-lived tasks within a Kubernetes cluster.
* It ensures that a specified number of Pods complete their tasks before the Job itself is considered complete. 
* This functionality is particularly useful for running batch processes, data processing, and other one-time tasks that do not require continuous operation.

### CronJobs:

### NameSpace:
In Kubernetes, a namespace is a mechanism for isolating groups of resources within a single cluster.  
It allows for the logical organization and management of resources, making it easier to handle multiple projects or teams that share the same cluster. 


### Persistent Volumes:
Persistent Volumes (PVs) are a crucial component of Kubernetes, designed to provide durable storage for containerized applications. 
Unlike regular volumes that are tied to the lifecycle of a pod, PVs exist independently and retain data even when pods are terminated or restarted. 
This capability is essential for stateful applications, such as databases, where data consistency and persistence are critical.

Modes in PV:
Retain, Delete, Recycle

Access modes:
4 modes.

Kubernetes Client:
Lens.

## Scheduling Pods and Nodes:
* nodeSelector: 
  	env: dev 
* Node Affinity and Anti-Affinity
* Pod Affinity and Anti-Affinity
* Taints and tolerations
* Resource Requests and limits
* Priority and Preemption

## Dynamic Manifest File:  
* Helm: This is a package manager for Kubernetes to make the manifest dynamic.

## Ingress and Ingress Controller:
	* We need to install ingress inside the Kubernetes
	* Then we can start using ingress inside the Kubernetes.


### Authentication and Authorization:

### AutoScalling: 
* Horzontal Pod Autoscalling
* Vertical Pod Autoscalling
* Node Autoscalling (Managed k8s Clusters)

### CRD (Custom Resource Definition) & Operators

<br><br>
### Application Observability:   
* Logs  
* Metrics  
* Traces  

## Installing K8s on local machine
