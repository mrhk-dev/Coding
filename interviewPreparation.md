1. How does Docker differ from traditional virtualization technologies like VMware or VirtualBox?

Docker and traditional virtualization technologies like VMware or VirtualBox differ in their approach to isolation. 

VirtualBox and VMware use a hypervisor to run multiple full-fledged virtual machines, each with its own operating system. This can be resource intensive, as every virtual machine needs its own CPU, disk, and memory resources.

In contrast, Docker uses containerization, an operating system-level virtualization method. Rather than creating a full operating system, Docker allows multiple applications to share the same OS kernel, effectively segregating them into separate containers. 

Each container houses an application and its dependencies but shares the host OS. This makes Docker containers lightweight and fast, as they don’t need to boot an entire OS.

Docker’s approach leads to efficient resource use and quick startup times compared with traditional virtualization technologies.

2. Explain the components of a Docker container and the purpose of each. For example, images, containers, Docker daemon, and Docker CLI.
Answer:

A Docker container has several components.

Images are read-only templates used to create Docker containers. They include the application and all its dependencies but exclude the host-specific settings, such as mounted directories from the host OS and networking information.

Containers are the runnable instances of Docker images. You can start, stop, move, or delete a container using Docker API or CLI. Each container is isolated from others and the host system.

Docker daemon (dockerd) is a background service that manages Docker containers. It listens for Docker API requests and handles Docker functionalities like building, distributing, and running Docker containers.

Docker CLI (Command Line Interface) is the primary user interface for Docker. Through Docker CLI, users can interact with Docker daemons to manage Docker objects like images, containers, networks, and volumes.

3. What is the difference between Docker images and Docker containers?
Answer:

A Docker image is a lightweight, stand-alone, executable software package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.

A Docker container is a runtime instance of a Docker image. When you run an image, Docker creates a container from that image. Containers are isolated from each other and bundle their own software, libraries, and system tools, enabling you to run your applications securely in any environment.

In short, Docker images are the building blocks, and Docker containers are the environment in which those blocks run.

4. Describe the Docker build process, including the role of Dockerfiles and caching mechanisms.
Answer: 

The Docker build process involves the following steps:

Write a Dockerfile. This text document contains all the commands needed to assemble an image. It’s the blueprint for creating Docker images.

Run the docker build command, which takes the Dockerfile and builds an image based on the instructions specified.

Each instruction in the Dockerfile creates a new layer in the image. These layers are stacked on top of each other to create the final image.

Dockerfile instructions include specifying a base image (FROM), setting the author of the image (LABEL), running commands (RUN), adding files or directories into the image (ADD) or COPY), exposing ports for inter-container communication (EXPOSE), and choosing what command to run when the container is launched from the image (CMD or ENTRYPOINT).

Docker uses a caching mechanism to speed up the build process. When Docker builds an image, it caches the result for each Dockerfile line. If you build again and the file hasn’t changed, Docker reuses the cached layers rather than rebuilding them, making the process faster.

5. How do you optimize Docker images for size and performance?
Answer: 

Optimizing Docker images for size and performance is essential for your applications to run and scale efficiently. There are several techniques you can use to optimize Docker images.

Use multi-stage builds: You can use one Docker image to build your application and a different, lighter image to run it. The final image doesn’t carry the baggage of the build tools and intermediate artifacts, reducing its size.

Minimize layers: Each RUN, COPY, or ADD command creates a new layer in your image. Combine these commands where possible to reduce the number of layers, using chaining commands (&&) in a single RUN instruction.

Use a dockerignore file: This file lets you specify files or directories that should be ignored when building an image, preventing unnecessary or sensitive data from being included.

Clean up in the same layer: Remove unnecessary files created by package managers within the same Dockerfile command. 

Use a smaller base image: Instead of using a full-fledged OS as your base image, consider using smaller, more focused base images to reduce your image size significantly.

6. Explain the concept of Docker networking and discuss the various network drivers available in Docker.
Answer:

Docker networking allows containers to communicate with each other and with other systems. 

Bridge: This is the default network driver for a container. If you don’t specify a driver, Docker creates a bridge network for the container by default. This provides a private internal network on the host where containers are attached, which can facilitate communication between them.

Host: The container’s network stack isn’t isolated from the Docker host if you use the host network driver. The container directly uses the networking of the Docker host. It’s faster than the bridge driver, but the container exposes its ports directly to the outside world.

Overlay: This driver is used in Docker Swarm to enable swarm services to communicate with each other. It’s ideal for distributed networks across multiple hosts.

MacVLAN: This driver assigns a MAC address to containers to make them appear as physical devices on the network. The Docker daemon routes traffic between containers and external networks.

None: This driver disables all networking for the container. 

7. What are Docker volumes, and how do they enable data persistence across containers?
Answer:

Docker volumes are the preferred mechanism for persisting data generated and used by Docker containers. 

By default, Docker containers are stateless. When a container is deleted, all the changes made to its file system are lost. Docker volumes solve the problem of persisting data in Docker containers. 

With Docker volumes, the data lives outside the containers and is stored on the host system. This makes the data persistent and independent of the life cycle of containers. The data in Docker volumes can be safely shared among multiple containers. Even if a container is deleted, the volume and its data will still exist.

8. How can you secure Docker containers and protect them from potential vulnerabilities?
Answer:

Multiple best practices are required to ensure the security of Docker containers.

Use trusted and minimal base images to reduce vulnerabilities.

Always pull Docker images from trusted sources, like Docker’s official repository.

Apply the principle of least privilege. Run containers with minimal permissions.

Avoid running containers or services as root when possible.

Keep the Docker environment up to date.

Secure communication between containers and outside networks. Use TLS for encryption if necessary.

Implement security scanning and monitoring tools for early vulnerability detection and prompt response.

Conduct regular security audits and reviews.

9. What is Docker Compose, and how does it simplify multi-container application deployments?
Answer:

Docker Compose is a tool that simplifies managing and deploying multi-container Docker applications. 

With Compose, you can define your multi-container application using a YAML file where you specify services, networks, and volumes. Each service corresponds to a container. You can specify the Docker image, environment variables, network, and volume it should use.

The power of Docker Compose comes when deploying a multi-container application. Instead of running each container separately and manually connecting them, you just need to type docker-compose up. 

This command will create the networks, volumes, and services as defined in your Compose file, dramatically simplifying the process and reducing the potential for human error.

10. Describe the role of Docker Swarm and Kubernetes in managing container orchestration.
Answer: 

Docker Swarm and Kubernetes are two popular container orchestration tools. They manage the lifecycle of containers and provide features for scaling, fail-over, deployment patterns, and more.

Docker Swarm is a native clustering and scheduling tool for Docker. It turns a pool of Docker hosts into a single, virtual Docker host, enabling you to create a swarm of Docker nodes and deploy services to them. It provides features like service discovery, load balancing, secure communication between nodes, and desired state management.

Kubernetes, often abbreviated to K8s, is a container orchestration platform maintained by the Cloud Native Computing Foundation (CNCF). It’s more feature-rich than Docker Swarm, providing advanced features like auto-scaling, rollouts and rollbacks, batch execution, secrets and configuration management, and storage orchestration.

While Docker Swarm is simpler to set up and integrates smoothly with Docker, Kubernetes has a larger community and is more versatile, orchestrating not just Docker but also other container runtimes. 

11. Explain the differences between a Docker registry and a Docker repository.
Answer:

A Docker registry is a storage and distribution system for named Docker images. The Docker Hub and Google Container Registry are examples of public registries, but you can also have private ones.

A Docker repository is a collection of different Docker images with the same name, distinguished by different tags. For example, in a repository called “debian”, you might have the tags 10, 11, and 12, each corresponding to a different image of the Debian operating system.

12. Describe the steps involved in upgrading or rolling back a Docker container to a different version.
Answer:

Upgrading or rolling back a Docker container involves replacing the existing container with a new one running a different image version. Here are the steps to do it.

Pull the new version of the image. Use docker pull to download the new version of the image from the Docker registry.

Stop and remove the existing container. Use docker stop to stop the running container and docker rm to remove it. You should store your persistent data in volumes or bind mounts so you don’t lose it when the container is removed.

Run the new container. Use docker run to start a new container from the new image version. Connect it to the network and volumes. Set the environment variables.

Tools like Docker Compose, Docker Swarm, or Kubernetes provide mechanisms for rolling updates that let you upgrade containers with zero downtime.

13. What are the benefits and use cases of using multi-stage builds in Docker?
Answer:

A multi-stage build in Docker involves multiple Dockerfile FROM instructions, each starting a new stage. Intermediate stages can produce artifacts like binaries or compiled code, which can be copied into later stages. Intermediate layers are left behind, reducing the final image size.

Multi-stage builds can help you create lean, secure, and efficient Docker images.

Use cases for multi-stage builds include:

Minimizing image size: You can use a large image with all the necessary build tools in the first stage to compile your application and then copy the compiled application into a smaller base image in a later stage.

Improving security: The final image can be kept minimal, reducing the attack surface. It doesn’t need to include the build tools and source code used in earlier stages.

Separating build-time and runtime dependencies: Different stages can have different dependencies, preventing unnecessary libraries from ending up in your final image.

Speeding up builds: If a stage doesn’t change often, Docker can use cached layers for that stage, speeding up the build process.

14. Discuss the impact of using the --privileged flag in Docker and why it should be used with caution.
Answer:

The --privileged flag in Docker is a powerful option that gives a container almost the same privileges as the host machine. This means the container can access and manipulate the host’s system resources, device drivers, and kernel modules, which could expose the host to security risks.

You should attempt to avoid using the --privileged flag because it overrides the security measures provided by Docker’s containerization model. It essentially defeats the purpose of isolating the application’s process and environment from the host system.

Instead of using the --privileged flag, a better practice is to use Linux capabilities, seccomp profiles, or AppArmor profiles to grant necessary privileges to a container on a granular level.

15. How does Docker handle resource limitations and isolation, such as CPU, memory, and I/O?
Answer:

Docker provides several mechanisms for limiting and isolating resources in a container, such as CPU, memory, and I/O.

CPU: Docker enables you to limit CPU usage by assigning a specific number of CPU shares to a container or specifying which CPUs or CPU cores a container can use. You can do this with the --cpu-shares, --cpuset-cpus, and --cpu-period options.

Memory: You can limit a container’s memory usage with the --memory option, which takes a memory size in bytes, kilobytes, megabytes, or gigabytes. Docker also enables setting a memory reservation limit with the --memory-reservation option.

I/O: Docker uses the I/O scheduler of the host operating system to manage I/O for containers. It also supports block I/O weight and limits with the --blkio-weight, --device-read-bps, and --device-write-bps options.

These resource isolation and limitation mechanisms help ensure that each container only uses its fair share of system resources and prevents one container from hogging resources and affecting the performance of others.












============================================================================================================================



1. What is Kubernetes?
This is one of the most basic Kubernetes interview questions yet one of the most important ones! Kubernetes is an open-source container orchestration tool or system that is used to automate tasks such as the management, monitoring, scaling, and deployment of containerized applications. It is used to easily manage several containers (since it can handle grouping of containers), which provides for logical units that can be discovered and managed.

2. What are K8s? 
K8s is another term for Kubernetes. 

3. What is orchestration when it comes to software and DevOps? 
Orchestration refers to the integration of multiple services that allows them to automate processes or synchronize information in a timely fashion. Say, for example, you have six or seven microservices for an application to run. If you place them in separate containers, this would inevitably create obstacles for communication. Orchestration would help in such a situation by enabling all services in individual containers to work seamlessly to accomplish a single goal. 

4. How are Kubernetes and Docker related?
This is one of the most frequently asked Kubernetes interview questions, where the interviewer might as well ask you to share your experience working with any of them. Docker is an open-source platform used to handle software development. Its main benefit is that it packages the settings and dependencies that the software/application needs to run into a container, which allows for portability and several other advantages. Kubernetes allows for the manual linking and orchestration of several containers, running on multiple hosts that have been created using Docker. 

5. What are the main differences between the Docker Swarm and Kubernetes?
Docker Swarm is Docker’s native, open-source container orchestration platform that is used to cluster and schedule Docker containers. Swarm differs from Kubernetes in the following ways:

Docker Swarm is more convenient to set up but doesn’t have a robust cluster, while Kubernetes is more complicated to set up but the benefit of having the assurance of a robust cluster
Docker Swarm can’t do auto-scaling (as can Kubernetes); however, Docker scaling is five times faster than Kubernetes 
Docker Swarm doesn’t have a GUI; Kubernetes has a GUI in the form of a dashboard 
Docker Swarm does automatic load balancing of traffic between containers in a cluster, while Kubernetes requires manual intervention for load balancing such traffic  
Docker requires third-party tools like ELK stack for logging and monitoring, while Kubernetes has integrated tools for the same 
Docker Swarm can share storage volumes with any container easily, while Kubernetes can only share storage volumes with containers in the same pod
Docker can deploy rolling updates but can’t deploy automatic rollbacks; Kubernetes can deploy rolling updates as well as automatic rollbacks
6. What is the difference between deploying applications on hosts and containers?
Deploying Applications consist of an architecture that has an operating system. The operating system will have a kernel that holds various libraries installed on the operating system needed for an application.

Whereas container host refers to the system that runs the containerized processes. This kind is isolated from the other applications; therefore, the applications must have the necessary libraries. The binaries are separated from the rest of the system and cannot infringe any other application.

7. What are the features of Kubernetes?
Kubernetes places control for the user where the server will host the container. It will control how to launch. So, Kubernetes automates various manual processes. 
Kubernetes manages various clusters at the same time. 
It provides various additional services like management of containers, security, networking, and storage. 
Kubernetes self-monitors the health of nodes and containers. 
With Kubernetes, users can scale resources not only vertically but also horizontally that too easily and quickly.
8. What are the main components of Kubernetes architecture?
There are two primary components of Kubernetes Architecture: the master node and the worker node. Each of these components has individual components in them.

9. Explain the working of the master node in Kubernetes?
The master node dignifies the node that controls and manages the set of worker nodes. This kind resembles a cluster in Kubernetes. The nodes are responsible for the cluster management and the API used to configure and manage the resources within the collection. The master nodes of Kubernetes can run with Kubernetes itself, the asset of dedicated pods.

40 Top Kubernetes Interview Questions and Answers for 2024
Lesson 5 of 5By Sana Afreen

Last updated on Jul 23, 2024700962
Top 40 Kubernetes Interview Questions and Answers for 2024
Previous
Table of Contents
Top 40 Kubernetes Interview Questions and AnswersJumpstart Your Career with Kubernetes Training
Kubernetes comes from a Greek word meaning ‘captain,’ ‘helmsman,’ or ‘governor.’ The term is now also used in the DevOps and on-premises software development world to refer to a powerful bundle of solutions that equips operations engineers to scale and service server (and box) setups effortlessly. 

This Kubernetes interview questions article will help you prepare for any interview or certification exam that you may need to take once you’ve completed the Kubernetes training. So, without further ado, let's jump right in and learn the top Kubernetes interview questions and answers.

Bridge the gap between software developers and operations and develop your career in DevOps by choosing our unique Post Graduate Program in DevOps. Enroll for the PGP in collaboration with Caltech CTME Today!
Top 40 Kubernetes Interview Questions and Answers
1. What is Kubernetes?
This is one of the most basic Kubernetes interview questions yet one of the most important ones! Kubernetes is an open-source container orchestration tool or system that is used to automate tasks such as the management, monitoring, scaling, and deployment of containerized applications. It is used to easily manage several containers (since it can handle grouping of containers), which provides for logical units that can be discovered and managed.

Earn the Most Coveted DevOps Certification!
DevOps Engineer Masters ProgramExplore ProgramEarn the Most Coveted DevOps Certification!
2. What are K8s? 
K8s is another term for Kubernetes. 

3. What is orchestration when it comes to software and DevOps? 
Orchestration refers to the integration of multiple services that allows them to automate processes or synchronize information in a timely fashion. Say, for example, you have six or seven microservices for an application to run. If you place them in separate containers, this would inevitably create obstacles for communication. Orchestration would help in such a situation by enabling all services in individual containers to work seamlessly to accomplish a single goal. 

4. How are Kubernetes and Docker related?
This is one of the most frequently asked Kubernetes interview questions, where the interviewer might as well ask you to share your experience working with any of them. Docker is an open-source platform used to handle software development. Its main benefit is that it packages the settings and dependencies that the software/application needs to run into a container, which allows for portability and several other advantages. Kubernetes allows for the manual linking and orchestration of several containers, running on multiple hosts that have been created using Docker. 

5. What are the main differences between the Docker Swarm and Kubernetes?
Docker Swarm is Docker’s native, open-source container orchestration platform that is used to cluster and schedule Docker containers. Swarm differs from Kubernetes in the following ways:

Docker Swarm is more convenient to set up but doesn’t have a robust cluster, while Kubernetes is more complicated to set up but the benefit of having the assurance of a robust cluster
Docker Swarm can’t do auto-scaling (as can Kubernetes); however, Docker scaling is five times faster than Kubernetes 
Docker Swarm doesn’t have a GUI; Kubernetes has a GUI in the form of a dashboard 
Docker Swarm does automatic load balancing of traffic between containers in a cluster, while Kubernetes requires manual intervention for load balancing such traffic  
Docker requires third-party tools like ELK stack for logging and monitoring, while Kubernetes has integrated tools for the same 
Docker Swarm can share storage volumes with any container easily, while Kubernetes can only share storage volumes with containers in the same pod
Docker can deploy rolling updates but can’t deploy automatic rollbacks; Kubernetes can deploy rolling updates as well as automatic rollbacks
6. What is the difference between deploying applications on hosts and containers?
Deploying Applications consist of an architecture that has an operating system. The operating system will have a kernel that holds various libraries installed on the operating system needed for an application.

Whereas container host refers to the system that runs the containerized processes. This kind is isolated from the other applications; therefore, the applications must have the necessary libraries. The binaries are separated from the rest of the system and cannot infringe any other application.

7. What are the features of Kubernetes?
Kubernetes places control for the user where the server will host the container. It will control how to launch. So, Kubernetes automates various manual processes. 
Kubernetes manages various clusters at the same time. 
It provides various additional services like management of containers, security, networking, and storage. 
Kubernetes self-monitors the health of nodes and containers. 
With Kubernetes, users can scale resources not only vertically but also horizontally that too easily and quickly.
8. What are the main components of Kubernetes architecture?
There are two primary components of Kubernetes Architecture: the master node and the worker node. Each of these components has individual components in them.

9. Explain the working of the master node in Kubernetes?
The master node dignifies the node that controls and manages the set of worker nodes. This kind resembles a cluster in Kubernetes. The nodes are responsible for the cluster management and the API used to configure and manage the resources within the collection. The master nodes of Kubernetes can run with Kubernetes itself, the asset of dedicated pods.

Earn the Most Coveted DevOps Certification!
DevOps Engineer Masters ProgramExplore ProgramEarn the Most Coveted DevOps Certification!

10. What is the role of Kube-apiserver?
This kind validates and provides configuration data for the API objects. It includes pods, services, replication controllers. Also, it provides REST operations and also the frontend of the cluster. This frontend cluster state is shared through which all other component interacts.

11. What is a node in Kubernetes?
A node is the smallest fundamental unit of computing hardware. It represents a single machine in a cluster, which could be a physical machine in a data center or a virtual machine from a cloud provider. Each machine can substitute any other machine in a Kubernetes cluster. The master in Kubernetes controls the nodes that have containers. 

12. What does the node status contain?
The main components of a node status are Address, Condition, Capacity, and Info.

13. What process runs on Kubernetes Master Node? 
The Kube-api server process runs on the master node and serves to scale the deployment of more instances.

14. What is a pod in Kubernetes?
In this Kubernetes interview question, try giving a thorough answer instead of a one-liner. Pods are high-level structures that wrap one or more containers. This is because containers are not run directly in Kubernetes. Containers in the same pod share a local network and the same resources, allowing them to easily communicate with other containers in the same pod as if they were on the same machine while at the same time maintaining a degree of isolation.

15. What is the job of the kube-scheduler?
The kube-scheduler assigns nodes to newly created pods.

16. What is a cluster of containers in Kubernetes? 
A cluster of containers is a set of machine elements that are nodes. Clusters initiate specific routes so that the containers running on the nodes can communicate with each other. In Kubernetes, the container engine (not the server of the Kubernetes API) provides hosting for the API server.


17. What is the Google Container Engine?
The Google Container Engine is an open-source management platform tailor-made for Docker containers and clusters to provide support for the clusters that run in Google public cloud services. 

18. What are Daemon sets?
A Daemon set is a set of pods that runs only once on a host. They are used for host layer attributes like a network or for monitoring a network, which you may not need to run on a host more than once.

19. What is ‘Heapster’ in Kubernetes?
In this Kubernetes interview question, the interviewer would expect a thorough explanation. You can explain what it is and also it has been useful to you (if you have used it in your work so far!). A Heapster is a performance monitoring and metrics collection system for data collected by the Kublet. This aggregator is natively supported and runs like any other pod within a Kubernetes cluster, which allows it to discover and query usage data from all nodes within the cluster.

20. What is Minikube?
With the help of Minikube, users can Kubernetes locally. This process lets the user run a single-node Kubernetes cluster on your personal computer, including Windows, macOS, and Linus PCs. With this, users can try out Kubernetes also for daily development work.

21. What is a Namespace in Kubernetes?
Namespaces are used for dividing cluster resources between multiple users. They are meant for environments where there are many users spread across projects or teams and provide a scope of resources.

22. Name the initial namespaces from which Kubernetes starts?
Default
Kube – system
Kube – public
23. What is the Kubernetes controller manager?
The controller manager is a daemon that is used for embedding core control loops, garbage collection, and Namespace creation. It enables the running of multiple processes on the master node even though they are compiled to run as a single process.

24. What are the types of controller managers?
The primary controller managers that can run on the master node are the endpoints controller, service accounts controller, namespace controller, node controller, token controller, and replication controller.

25. What is etcd?
Kubernetes uses etcd as a distributed key-value store for all of its data, including metadata and configuration data, and allows nodes in Kubernetes clusters to read and write data. Although etcd was purposely built for CoreOS, it also works on a variety of operating systems (e.g., Linux, BSB, and OS X) because it is open-source. Etcd represents the state of a cluster at a specific moment in time and is a canonical hub for state management and cluster coordination of a Kubernetes cluster.

26. What are the different services within Kubernetes?
Different types of Kubernetes services include: 

Cluster IP service
Node Port service
External Name Creation service and 
Load Balancer service

27. What is ClusterIP?
The ClusterIP is the default Kubernetes service that provides a service inside a cluster (with no external access) that other apps inside your cluster can access. 

28. What is NodePort? 
The NodePort service is the most fundamental way to get external traffic directly to your service. It opens a specific port on all Nodes and forwards any traffic sent to this port to the service.

29. What is the LoadBalancer in Kubernetes? 
The LoadBalancer service is used to expose services to the internet. A Network load balancer, for example, creates a single IP address that forwards all traffic to your service. 

30. What is the Ingress network, and how does it work?
 An ingress is an object that allows users to access your Kubernetes services from outside the Kubernetes cluster. Users can configure the access by creating rules that define which inbound connections reach which services.

How does it work- This is an API object that provides the routing rules to manage the external users' access to the services in the Kubernetes cluster through HTTPS/ HTTP. With this, users can easily set up the rules for routing traffic without creating a bunch of load balancers or exposing each service to the nodes.

31. What do you understand by Cloud controller manager?
You must have heard about Public, Private and hybrid clouds. With the help of cloud infrastructure technologies, you can run Kubernetes on them. In the context of Cloud Controller Manager, it is the control panel component that embeds the cloud-specific control logic. This process lets you link the cluster into the cloud provider's API and separates the elements that interact with the cloud platform from components that only interact with your cluster. 

This also enables the cloud providers to release the features at a different pace compared to the main Kubernetes project. It is structured using a plugin mechanism and allows various cloud providers to integrate their platforms with Kubernetes.

32. What is Container resource monitoring?
This refers to the activity that collects the metrics and tracks the health of containerized applications and microservices environments. It helps to improve health and performance and also makes sure that they operate smoothly.

33. What is the difference between a replica set and a replication controller?
A replication controller is referred to as RC in short. It is a wrapper on a pod. This provides additional functionality to the pods, which offers replicas. 

It monitors the pods and automatically restarts them if they fail. If the node fails, this controller will respawn all the pods of that node on another node. If the pods die, they won't be spawned again unless wrapped around a replica set. 

Replica Set, on the other hand, is referred to as rs in short. It is told as the next-generation replication controller. This kind of support has some selector types and supports the equality-based and the set-based selectors. 

It allows filtering by label values and keys. To match the object, they have to satisfy all the specified label constraints.

34. What is a headless service?
A headless service is used to interface with service discovery mechanisms without being tied to a ClusterIP, therefore allowing you to directly reach pods without having to access them through a proxy. It is useful when neither load balancing nor a single Service IP is required. 

35. What are federated clusters?
The aggregation of multiple clusters that treat them as a single logical cluster refers to cluster federation. In this, multiple clusters may be managed as a single cluster. They stay with the assistance of federated groups. Also, users can create various clusters within the data center or cloud and use the federation to control or manage them in one place. 

You can perform cluster federation by doing the following: 

Cross cluster that provides the ability to have DNS and Load Balancer with backend from the participating clusters. 

Users can sync resources across different clusters in order to deploy the same deployment set across the various clusters.

36. What is Kubelet?
The kubelet is a service agent that controls and maintains a set of pods by watching for pod specs through the Kubernetes API server. It preserves the pod lifecycle by ensuring that a given set of containers are all running as they should. The kubelet runs on each node and enables the communication between the master and slave nodes.

37. What is Kubectl?
Kubectl is a CLI (command-line interface) that is used to run commands against Kubernetes clusters. As such, it controls the Kubernetes cluster manager through different create and manage commands on the Kubernetes component

38. Give examples of recommended security measures for Kubernetes.
Examples of standard Kubernetes security measures include defining resource quotas, support for auditing, restriction of etcd access, regular security updates to the environment, network segmentation, definition of strict resource policies, continuous scanning for security vulnerabilities, and using images from authorized repositories.

39. What is Kube-proxy? 
Kube-proxy is an implementation of a load balancer and network proxy used to support service abstraction with other networking operations. Kube-proxy is responsible for directing traffic to the right container based on IP and the port number of incoming requests.

40. How can you get a static IP for a Kubernetes load balancer? 
A static IP for the Kubernetes load balancer can be achieved by changing DNS records since the Kubernetes Master can assign a new static IP address.


================================================================================================

1. What do you understand by Terraform in AWS?
Terraform is a part of the AWS DevOps Competency and also an AWS Partner Network (APN) advanced technology partner. It is similar to AWS Cloud Formation in the sense that it is also an “infrastructure as code” tool that allows you to create, update, and version your AWS infrastructure.

2. What are the key features of Terraform?
Terraform helps you manage all of your infrastructures as code and construct it as and when needed. Here are its key main features:

A console that allows users to observe functions 
The ability to translate HCL code into JSON format
A configuration language that supports interpolation 
A module count that keeps track of the number of modules applied to the infrastructure.

3. Define IAC?
IAC or Infrastructure as Code allows you to build, change, and manage your infrastructure through coding instead of manual processes. The configuration files are created according to your infrastructure specifications and these configurations can be edited and distributed securely within an organization.

Get Certifications in AWS, Azure and Google Cloud
Cloud Architect Master's ProgramExplore ProgramGet Certifications in AWS, Azure and Google Cloud

4. What are the most useful Terraform commands?
Some of the most useful Terraform commands are:

terraform init - initializes the current directory
terraform refresh - refreshes the state file
terraform output - views Terraform outputs
terraform apply - applies the Terraform code and builds stuff
terraform destroy - destroys what has been built by Terraform
terraform graph - creates a DOT-formatted graph
terraform plan - a dry run to see what Terraform will do

5. Are callbacks possible with Terraform on Azure?
By using the Azure Event Hubs, callbacks are probable on Azure. Terraform’s Azure supplier provides effortless functionality to users. Microsoft Azure Cloud Shell provides an already installed Terraform occurrence.

6. What is Terraform init?
Terraform init is a control to initialize an operational index that contains Terraform pattern files. This control can be looped multiple times. It is the first command that should be run after writing the new Terraform design.

7. What is Terraform D?
Terraform D is a plugin used on most in-service systems and Windows. Terraform init by default searches next directories for plugins.

8. Is history the same as it is on the web while using TFS API to provide resources?
Yes, the narration is similar to on the web because UI keeps API as the base. The whole thing that is on the UI is availed during other methods and the API.

9. Why is Terraform used for DevOps?
Terraform uses a JSON-like configuration language called the HashiCorp Configuration Language (HCL). HCL has a very simple syntax that makes it easy for DevOps teams to define and enforce infrastructure configurations across multiple clouds and on-premises data centers.

10. Define null resource in Terraform.
null_resource implements standard resource library, but no further action is taken. The triggers argument allows an arbitrary set of values that will cause the replacement of resources when changed.

11. What do you mean by Terraform cloud?
Terraform Cloud is a platform that enables teams to use Terraform together, either on-demand or in response to various events. It is deeply integrated with Terraform's workflows and data, unlike a general-purpose continuous integration system. It includes easy access to shared state and secret data, detailed policy controls for updating infrastructure and governing the contents of Terraform, a private registry for sharing Terraform modules, and lots more.

12. Explain Oracle Cloud Infrastructure.
Oracle cloud offered by Oracle Corporation is a cloud computing service providing storage, servers, applications, services, and networks through a global network of managed data centers by Oracle Corporation. These services are provisioned on-demand over the Internet by the company.

13. What do you understand by terraform backend?
Each Terraform configuration can specify a backend, which defines two main things:

Where operations are performed 
Where the state is stored (Terraform keeps track of all the resources created in a state file)

14. What are the version controls supported by Terraform besides GitHub?
The version controls supported GitLab EE, GitLab CE, and Bucket Cloud.

15. Name some major competitors of Terraform.
Some of the top competitors and alternatives to Terraform are Azure Management Tools, Morpheus, CloudHealth, Turbonomic, and CloudBolt.

16. Explain the uses of Terraform CLI and list some basic CLI commands?
The Terraform Command-Line Interface (CLI) is used to manage infrastructure and interact with Terraform state, configuration files, providers, etc.

Here are some basic CLI commands:

terraform init - prepares your working directory for other commands
terraform destroy - destroys the previously-created infrastructure
terraform validate - check whether the configuration is valid
terraform apply - creates or updates the infrastructure
terraform plan - shows changes needed by the current configuration

17. What are modules in Terraform?
A jug for numerous resources that are used jointly is known as a module in Terraform. The root module includes resources mentioned in the .tf files and is required for every Terraform.

18. What is a Private Module Registry?
A Private Module Registry is a feature from Terraform Cloud that allows you to share Terraform modules across the organization. You can enforce rules or “sentinel policies” on the registry that specify how members of your organization can use the modules.

19. Is Terraform usable for an on-prem infrastructure?
Yes, Terraform can be used for on-prem infrastructure. As there are a lot of obtainable providers, we can decide which suits us the best. All that we need is an API.

20. Does Terraform support multi-provider deployments?
Yes, multi-provider deployments are supported by Terraform, which includes on-prem like Openstack, VMware, and we can manage SDN even using Terram too.

Also Read: VMware vSphere Best Practices

21. How is duplicate resource error ignored during terraform apply?
We can try the following options:

Delete those resources from the cloud provider(API) and recreate them using Terraform
Delete those resources from Terraform code to stop its management with it
Carry out a terraform import of the resource and remove the code that is trying to recreate them

22. Name all version controls supported by Terraform
The supported version controls are:

Azure DevOps Services
Azure DevOps Server
Bitbucket Server
Bitbucket Cloud
Gitlab EE and CE
Gitlab.com
GitHub Enterprise
GitHub.com (OAuth)
GitHub.com

23. What are some of the built-in provisioners available in Terraform?
Here is the list of built-in provisioners in Terraform:

Salt-masterless Provisioner
Remote-exec Provisioner
Puppet Provisioner
Local-exec Provisioner
Habitat Provisioner
File Provisioner
Chef Provisioner

24. Which command destroys Terraform managed infrastructure?
The given command is used for this purpose:
terraform destroy [options] [dir]

25. Tell us about some notable Terraform applications.
The applications of Terraform are pretty broad due to its facility of extending its abilities for resource manipulation. Some of the unique applications are:

Software demos development
Resource schedulers
Multi-cloud deployment
Disposable environment creations
Multi-tier applications development
Self-service clusters
Setup of Heroku App
26. What are the components of Terraform architecture?
The Terraform architecture includes the following features:

Sub-graphs
Expression Evaluation
Vertex Evaluation
Graph Walk
Graph Builder
State Manager
Configuration Loader
CLI (Command Line interface)
Backend

27. Define Resource Graph in Terraform.
A resource graph is a visual representation of the resources. It helps modify and create independent resources simultaneously. Terraform establishes a plan for the configuration of the graph to generate plans and refresh the state. It creates structure most efficiently and effectively to help us understand the drawbacks.

28. Can you provide a few examples where we can use for Sentinel policies?
Sentinels are a powerful way to implement a variety of policies in Terraform. Here are a few examples:

Enforce explicit ownership in resources
Restrict roles the cloud provider can assume
Review an audit trail for Terraform Cloud operations
Forbid only certain resources, providers, or data sources
Enforce mandatory tagging on resources 
Restrict how modules are used in the Private Module Registry
29. What are the various levels of Sentinel enforcement?
Sentinel has three enforcement levels - advisory, soft mandatory, and hard mandatory.

Advisory - Logged but allowed to pass. An advisory is issued to the user when they trigger a plan that violates the policy.
Soft Mandatory - The policy must pass unless an override is specified. Only administrators have the ability to override.
Hard Mandatory - The policy must pass no matter what. This policy cannot be overridden unless it is removed. It is the default enforcement level in Terraform.
30. How to Store Sensitive Data in Terraform?
Terraform requires credentials to communicate with your cloud provider's API. But most of the time, these credentials are saved in plaintext on your desktop. GitHub is exposed to thousands of API and cryptographic keys every day. Hence, your API keys should never be stored in Terraform code directly.  You should use encrypted storage to store all your passwords, TLS certificates, SSH keys, and anything else that shouldn't be stored in plain text.

31. What is Terragrunt, and what are its uses?
Terragrunt is a thin wrapper that provides extra tools to keep configurations DRY, manage remote state and work with multiple Terraform modules. It is used for:

Working with multiple AWS accounts
Executing Terraform commands on multiple modules
Keeping our CLI flags DRY
Keeping our remote state configuration DRY
Keeping our Terraform code DRY
32. Explain State File Locking?
State file locking is Terraform mechanism in which operations on a specific state file are blocked to avoid conflicts between multiple users performing the same process. When one user releases the lock, then only the other one can operate on that state. This helps in preventing state file corruption. This is a backend operation.

33. What do you understand by a Tainted Resource?
A tainted resource is a resource that is forced to be destroyed and recreated on the next apply command. When a resource is marked as tainted, the state files are updated, but nothing changes on infrastructure. The terraform plan out shows that help will get destroyed and recreated. The changes get implemented when the next apply happens.

34. How to lock Terraform module versions?
A proven way of locking Terraform module version is using the Terraform module registry as a source. We can use the ‘version’ attribute in module of the Terraform configuration file. As the Github repository is being used as a source, we need to specify versions, branch, and query string with ‘?ref’.

35. What is Terraform Core? Tell us some primary responsibilities of it.
Terraform Core is a binary written statically compiled by using the Go programming language. The compiled binary offers an entry point for the users of Terraform. The primary responsibilities include:

Reading and interpolation of modules and configuration files by Infrastructure as code functionalities
Resource Graph Construction
Plugin communication through RPC
Plan execution
Management of resource state
36. Give the terraform configuration for creating a single EC2 instance on AWS.
This is the Terraform configuration for creating a single EC2 instance on AWS:

provider “aws” {

region = “”}

resource “aws_instance”

“example” {

ami = ""

instance_type = ""

tags {

 Name = "example"}

37. How will you upgrade plugins on Terraform?
Run ‘terraform init’ with ‘-upgrade’ option. This command rechecks the releases.hashicorp.com to find new acceptable provider versions. It also downloads available provider versions. “.terraform/plugins/<OS>_<ARCH>” is the automatic downloads directory.

38. How will you make an object of one module available for the other module at a high level?
Ab output variable is defined in resource configuration.
Declare the output variable of module_A.
Create a file variable.tf for module B.
Establish the input variable inside this file having the same name as the key defined in module_B.
Replicate the process for making variable available to other modules

39. What are some of the latest Terraform Azure Provider factors?
The latest versions involve new data resources and Azurem_batch_certificate, which helps in managing the certificate. This resource is used for controlling the prefix in networking. There is fixing of bugs, and azurerm_app_service has also been enhanced.

40. How will you control and handle rollbacks when something goes wrong?
I need to recommit the previous code version to be the new and current version in my VCS. This would trigger as terraform run, which would be responsible for running the old code. As Terraform is more declarative, I will make sure all things in the code roll back to the old code. I would use the State Rollback Feature of Terraform Enterprise to roll back to the latest state if the state file got corrupted.



