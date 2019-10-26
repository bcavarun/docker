# Docker Notes

Docker is available in three tiers:
1. Docker Engine - Community
2. Docker Engine - Enterprise
3. Docker Enterprise

## Docker overview
* Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.
* Containerization is increasingly popular because containers are:
 * Flexible: Even the most complex applications can be containerized.
 * Lightweight: Containers leverage and share the host kernel, making them much more efficient in terms of system resources than virtual machines.
 * Portable: You can build locally, deploy to the cloud, and run anywhere.
 * Loosely coupled: Containers are highly self sufficient and encapsulated, allowing you to replace or upgrade one without disrupting others.
 * Scalable: You can increase and automatically distribute container replicas across a datacenter.
 * Secure: Containers apply aggressive constraints and isolations to processes without any configuration required on the part of the user.

## Docker Engine
* Docker Engine is a client-server application with these major components:
 * A server which is a type of long-running program called a daemon process (the dockerd command).
 * A REST API which specifies interfaces that programs can use to talk to the daemon and instruct it what to do.
 * A command line interface (CLI) client (the docker command).

## Docker objects
* When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

## IMAGES
* An image is a read-only template with instructions for creating a Docker container.
* To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image
* Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt.

## CONTAINERS
* A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI.
* You can connect a container to one or more networks, attach storage to it, <b> or even create a new image based on its current state. </b>
* Fundamentally, a container is nothing but a running process, with some added encapsulation features applied to it in order to keep it isolated from the host and from other containers.
* One of the most important aspects of container isolation is that each container interacts with its own, private filesystem; this filesystem is provided by a Docker image.
* An image includes everything needed to run an application -- the code or binary, runtimes, dependencies, and any other filesystem objects required.

## SERVICES
* Services allow you to scale containers across multiple Docker daemons, which all work together as a swarm with multiple managers and workers.
* Each member of a swarm is a Docker daemon, and the daemons all communicate using the Docker API.
* A service allows you to define the desired state, such as the number of replicas of the service that must be available at any given time.
* By default, the service is load-balanced across all worker nodes. To the consumer, the Docker service appears to be a single application.
* Docker Engine supports swarm mode in Docker 1.12 and higher.

## Namespaces
* Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.
* These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.
* Docker Engine uses namespaces such as the following on Linux:
 * The pid namespace: Process isolation (PID: Process ID).
 * The net namespace: Managing network interfaces (NET: Networking).
 * The ipc namespace: Managing access to IPC resources (IPC: InterProcess Communication).
 * The mnt namespace: Managing filesystem mount points (MNT: Mount).
 * The uts namespace: Isolating kernel and version identifiers. (UTS: Unix Timesharing System).

## Control groups
* Docker Engine on Linux also relies on another technology called control groups (cgroups).
* A cgroup limits an application to a specific set of resources.
* Control groups allow Docker Engine to share available hardware resources to containers and optionally enforce limits and constraints. For example, you can limit the memory available to a specific container.

## Union file systems
* Union file systems, or UnionFS, are file systems that operate by creating layers, making them very lightweight and fast.
* Docker Engine uses UnionFS to provide the building blocks for containers. Docker Engine can use multiple UnionFS variants, including AUFS, btrfs, vfs, and DeviceMapper.

## Container format
* Docker Engine combines the namespaces, control groups, and UnionFS into a wrapper called a container format. The default container format is libcontainer.
