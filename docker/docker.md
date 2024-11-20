# What is Docker?
* Docker is an open-source platform that enables developers to build, share, and run applications in lightweight, portable environments known as containers.  
* It has become a fundamental tool in modern software development, particularly for microservices architecture and DevOps practices.

## Key features of Docker:
#### Containerization: 
* Docker packages applications and their dependencies into containers isolated from the host system.
* This allows applications to run consistently across various environments, such as development, testing, and production, without compatibility issues.
#### Efficiency: 
* Containers share the host operating system's kernel, making them more lightweight compared to traditional virtual machines (VMs). 
* This results in faster startup times and better resource utilization, allowing multiple containers to run on a single server
#### Portability: 
* Docker containers can run on any system with the Docker Engine installed, whether on-premises servers or cloud environments. 
* This portability simplifies the deployment and scaling of applications.
#### Development Workflow: 
* Docker enhances the development lifecycle by enabling continuous integration and delivery (CI/CD) practices. 
* Developers can create a containerized application locally, test it, and then deploy it to production with minimal changes.
<br><br>


## Components of Docker:
#### Docker Engine: 
* The core component that runs and manages containers. It consists of:
#### Docker Daemon (dockerd): 
* Manages container operations and handles requests from the Docker client.
#### Docker Client (docker): 
* The command-line interface used to interact with the Docker daemon45.
#### Docker Images: 
* Read-only templates used to create containers. 
* They contain everything needed to run an application, including code, libraries, and dependencies35.
#### Docker Containers: 
* The running instances of Docker images. 
* Containers are ephemeral, they can be created, modified, and destroyed easily.
#### Docker Registry: 
* A repository for storing Docker images, such as Docker Hub or private registries

## What is a container in Docker?
* Docker containers are standardized, encapsulated environments that allow applications to run in isolation from one another and the host system.
* They are created from Docker images, which serve as the blueprint containing the application code and all necessary dependencies, libraries, and settings required for execution.	

## How Docker works:

1. ## Core Components
#### Docker Engine: 
* The core component responsible for creating and managing containers. 
* It operates as a client-server application with three main parts:
* #### Docker Daemon (dockerd): 
* * Runs as a background service and manages Docker containers, images, networks, and volumes.
* #### Docker Client: 
* * The command-line interface (CLI) that users interact with to issue commands to the Docker daemon.
* #### REST API: 
* * Allows communication between the client and daemon, enabling remote management of containers.

2. ## Containerization Process
* #### Docker Images: 
* Read-only templates used to create containers. 
* Each image consists of multiple layers, built on top of a base image, containing all necessary dependencies for the application.
* #### Docker Containers: 
* Instances of Docker images that run as isolated processes on the host operating system. 
* Containers share the OS kernel but maintain their own filesystem and environment.
* #### Docker Registries: 
* Repositories for storing and distributing Docker images. 
* The default public registry is Docker Hub.

---
We provide the commands from docker cli(docker client)  
The command is then sent to the docker demon  
The docker demon checks if the image is available in the docker repo  
If available then it runs else it downloads from the docker Registry.  
After downloading it runs in a container  
---

<br><br>
<br>
## Docker commands:

### How to check if the docker is installed?
* command: "docker info" 

### How to run the first image in docker?
* command: "docker run hello-world"

### How to check the status of the container?
* command: "docker container ls"


### What are downloaded when we install docker?
* Docker Engine
* Docker Cli
* Docker Images
* Docker compose
* Docker buildx

### What container gets when it is created and run?
* When a Docker container is created and run, it encapsulates several processes and resources that are essential for its operation. 
* Here’s a breakdown of what happens with the container process:
* #### Main Process:
* Each Docker container runs a single main process, which is defined by the ENTRYPOINT or CMD instructions in the Dockerfile. 
* This main process is assigned a Process ID (PID) of 1 within the container35. If this main process exits, the entire container stops.
* #### Subprocesses:
* The main process can spawn multiple subprocesses. These subprocesses will have their own unique PIDs but are tied to the lifecycle of the main process. 
* If the main process terminates, all associated subprocesses are also terminated.
* #### Isolation:
* Containers provide an isolated environment for processes, meaning that they run independently from processes on the host system. 
* However, since containers share the host OS kernel, processes running inside a container can be seen from the host using commands like ps, but they will appear with different PIDs on the host.
* #### Resource Allocation:
* Docker uses Linux kernel features such as namespaces and cgroups to manage resources and isolate processes. 
* Namespaces provide separate views of system resources for each container, while cgroups limit resource usage (CPU, memory) for each container.
* #### Networking:
* Each container has its own network stack, allowing it to communicate with other containers and external systems through defined ports and protocols. 
* Docker automatically sets up a virtual network for containers to facilitate this  communication.
* #### File System:
* Containers have their own filesystem layers built on top of the base image. 
* This filesystem is isolated from the host and other containers, allowing processes within a container to operate without affecting the host's filesystem.

### What are nameSpace in Docker?
* Docker namespaces are a fundamental feature of the Docker architecture that provides isolation for containerized applications. 
* They allow each container to operate in its own environment, ensuring that processes running inside one container do not interfere with those in another or with the host system.
* Here’s a detailed overview of the different types of namespaces used in Docker:
* #### Types of Docker Namespaces
* #### PID Namespace:
* Isolates the process ID number space. 
* Each container has its own PID namespace, meaning that processes can have the same PID within different containers. 
* The main process of a container runs as PID 1, while it may have a different PID on the host system.
* #### NET Namespace:
* Manages network interfaces and provides each container with its own network stack. 
* This allows containers to have their own IP addresses and network configurations, enabling them to communicate with each other and the outside world without conflicts.
* #### IPC Namespace:
* Isolates inter-process communication (IPC) resources, such as message queues and shared memory. 
* This ensures that IPC mechanisms used by one container do not affect others, maintaining data integrity and security.
* #### MNT Namespace:
* Provides an isolated view of the filesystem, allowing containers to have their own filesystem mounts. 
* This means that changes made within a container do not affect the host filesystem or other containers.
* #### UTS Namespace:
* Isolates hostname and domain name settings. 
* Each container can have its own hostname and domain name, which is particularly useful for applications that rely on these settings for configuration or identification.
* #### USER Namespace:
* Isolates user and group IDs, allowing containers to run with different user privileges than those on the host system. 
* This enhances security by preventing processes in a container from having root privileges on the host.


### Containerazation:
* Containerization is a modern software deployment method that packages an application along with all its necessary components such as libraries, dependencies, and configuration files into a single, lightweight unit known as a container.
> Making applications work in container is refered as conteinerization.  
* This approach allows applications to run consistently across different computing environments without the need for extensive modifications.  
  <br>
<hr>
### How to create a Docker image:  
* There are two ways to create a docker image:
	1. Using a Dockerfile
	2. Creating an Image from an Existing Container
	3. Using Docker Compose
	4. Using GUI Tools

#### Using a Dockerfile:
A Dockerfile is a text file that contains a series of instructions on how to build a Docker image.  
This method is the most common and provides a repeatable way to create images.

* ###### Steps to Create an Image Using a Dockerfile:  
Define the Base Image: Use the FROM instruction to specify the base image.  
Set Working Directory: Use WORKDIR to define the working directory inside the container.  
Copy Files: Use COPY to add files from your local machine into the image.  
Install Dependencies: Use RUN to execute commands, such as installing packages.  
Set Environment Variables: Use ENV to define environment variables within the image.  
Specify Entry Point: Use ENTRYPOINT or CMD to define what command should run when the container starts.  

Refer here for [Instructions for writing docker file](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/)

#### Creating an Image from an Existing Container  
You can also create a Docker image by modifying an existing container and then committing those changes.  
* #### Steps:
* Run a Container: Start a container from an existing image.
```bash
docker run -it --name my-container python:alpine3.17
```
* Make Changes: Inside the container, install packages, copy files, etc.
* Commit Changes: Once you have made your changes, exit the container and commit it to create a new image.
```bash
docker commit running-container-name my-new-image-name
```

#### Using Docker Compose:
For applications that require multiple services, you can define your application stack in a docker-compose.yml file and build images as part of that process.

* Example docker-compose.yml
```
version: '3'
services:
  web:
    build: .
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```

Build Command  
Run the following command in the directory containing your docker-compose.yml:
```
docker-compose up --build
```

* #### Using GUI Tools
There are graphical user interfaces (GUIs) like EasyPanel or Portainer that allow users to create and manage Docker images without using command-line instructions.   
These tools simplify the process for users who may not be familiar with command-line operations.



<br><br><br><br>

# Docker commands:

## Container Management Commands

docker run: Create and run a new container from an image.
```
docker run --name <container_name> <image_name>
```

docker ps: List all running containers.   
* Use -a to show all containers (running and stopped).
```
docker ps -a
```

docker start: Start one or more stopped containers.
```
docker start <container_name>
```

docker stop: Stop one or more running containers.
```
docker stop <container_name>
``` 

docker rm: Remove one or more stopped containers.
```
docker rm <container_name>
```

docker exec: Execute a command in a running container (e.g., open a shell).
```bash
docker exec -it <container_name> sh
```

## Image Management Commands
docker build: Build an image from a Dockerfile.
```bash
docker build -t <image_name>:<tag> <path_to_dockerfile>
``` 

docker pull: Pull an image from a registry (e.g., Docker Hub).
```bash
docker pull <image_name>
```

docker images: List all images on the local system.
```bash
docker images
```

docker rmi: Remove one or more images.
```bash
docker rmi <image_name>:<tag>
```

docker tag: Tag an existing image with a new name.
```bash
docker tag <existing_image> <new_image_name>
```

## Network Management Commands
docker network create: Create a new Docker network.
```bash
docker network create <network_name>
```

docker network ls: List all networks.
```bash
docker network ls
```

docker network inspect: Display detailed information about a specific network.
```bash
docker network inspect <network_name>
```

## Volume Management Commands
docker volume create: Create a new volume for persistent data storage.
```bash
docker volume create <volume_name>
```

docker volume ls: List all volumes.
```bash
docker volume ls
```

docker volume inspect: Display detailed information about a specific volume.
```bash
docker volume inspect <volume_name>
```





