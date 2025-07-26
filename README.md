## **Kubernetes**

**Kubernetes** (often abbreviated as **K8s**) is an **open-source container orchestration platform** used to automate the **deployment, scaling, and management** of containerized applications.

---

### 🔑 Key Features:

* **Container Orchestration**: Manages and runs containers (like Docker) across a cluster of machines.
* **Self-Healing**: Restarts failed containers, replaces and reschedules them as needed.
* **Load Balancing**: Distributes traffic across multiple containers or services.
* **Scaling**: Automatically scales applications up or down based on demand.
* **Rolling Updates**: Updates apps without downtime.
* **Service Discovery**: Enables communication between services without hardcoding IPs.

---

### 📦 Core Components:

* **Pods**: The smallest deployable unit; a group of one or more containers.
* **Deployments**: Define how pods are created and managed.
* **Services**: Expose pods to other services or the internet.
* **Nodes**: Machines (VMs or physical) that run container workloads.
* **Cluster**: A set of nodes managed by Kubernetes.

---

### ✅ Why Use Kubernetes?

* Efficient resource use
* High availability
* Easy rollbacks and upgrades
* Works on cloud, on-prem, or hybrid

---

### 🧾 Short Note on **Minikube**

**Minikube** is a tool that lets you **run Kubernetes locally**. It creates a **single-node Kubernetes cluster** on your **local machine** so you can test and develop applications before deploying them to a full Kubernetes environment.

---

### 🔑 Key Features:

* Runs a **lightweight Kubernetes cluster** inside a VM or container.
* Supports **Docker, VirtualBox, Hyper-V**, and **none (bare-metal)** drivers.
* Ideal for **learning, development**, and **testing** Kubernetes apps.
* Comes with built-in support for **addons** like the Kubernetes Dashboard, Ingress, and more.

---

### 📦 Common Commands:

* `minikube start`: Starts the local cluster.
* `minikube status`: Shows the status of the cluster.
* `minikube dashboard`: Opens a web UI for managing the cluster.
* `minikube service <service-name>`: Opens a URL to access a deployed service.

---

### ✅ Why Use Minikube?

* No need for a full cloud setup.
* Quick and simple for development use.
* Helps simulate real Kubernetes behavior in a local setting.

---

**Minikube** is perfect for developers who want to learn Kubernetes, build and test apps locally before pushing to production.




### **Container Orchestration With Kubernetes**

Imagine orchestrating a vibrant culinary event with various chefs preparing different dishes. Container orchestration, seamlessly coordinates each chef (container) to ensure the perfect serving, timing, and overall dining experience. Just as a skilled event planner brings order to chaos, Kubernetes, a notable orchestrator, orchestrates containers, making it the go-to choice for managing the intricate dance of modern applications. Container orchestration is a critical aspect of managing and scaling containerized applications efficiently. It involves automating the deployment, scaling, and operation of containerized applications, ensuring seamless coordination among multiple containers to deliver high availability and optimal performance. One widely used container orchestration tool is Kubernetes. Developed by Google, Kubernetes has become the de facto standard for automating the deployment, scaling, and management of containerized applications.

---

### **What is Kubernetes ?**

Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. Developed by Google and later open-sourced. Kubernetes is widely adopted for its ability to streamline and automate the deployment, scaling, and management of containerized applications in a highly efficient and consistent manner. It provides a centralized platform that abstracts away the complexities of distributed systems, offering features such as automated load balancing, self-healing capabilities, and seamless rolling updates.

A **Kubernetes cluster** consists of **two main components**: the **Control Plane** and the **Worker Nodes**. Together, they manage and run containerized applications in a scalable and resilient manner.

---

### 🧠 **1. Control Plane (Master Components)**

The control plane is responsible for managing the overall state of the cluster, including scheduling, responding to cluster events, and maintaining the desired state.

**Key components:**

| Component                                 | Description                                                                                 |
| ----------------------------------------- | ------------------------------------------------------------------------------------------- |
| **kube-apiserver**                        | The front-end for the Kubernetes control plane. All requests go through it.                 |
| **etcd**                                  | A distributed key-value store used to store all cluster configuration data.                 |
| **kube-scheduler**                        | Assigns Pods to nodes based on resource availability and other constraints.                 |
| **kube-controller-manager**               | Runs controllers that handle routine tasks like node health, replication, and job tracking. |
| **cloud-controller-manager** *(optional)* | Manages cloud-specific control logic (e.g., load balancers, volumes).                       |

---

### ⚙️ **2. Worker Nodes (Node Components)**

Worker nodes are the machines (virtual or physical) where application containers actually run.

**Key components:**

| Component             | Description                                                                       |
| --------------------- | --------------------------------------------------------------------------------- |
| **kubelet**           | Agent that runs on each node; communicates with the control plane to manage Pods. |
| **kube-proxy**        | Handles networking; forwards traffic to the appropriate Pods.                     |
| **Container Runtime** | Software that runs containers (e.g., Docker, containerd, CRI-O).                  |

---

### 🧩 Additional Concepts:

* **Pod**: The smallest deployable unit in Kubernetes, usually containing one or more containers.
* **ReplicaSet**: Ensures a specified number of pod replicas are running.
* **Deployment**: Manages stateless application rollout and updates.
* **Service**: Provides networking abstraction to expose Pods as a service.
* **Namespace**: Logical partitioning of cluster resources for isolation.

## Project on Kubenetes Installing Minikube

1. To begin with we need to install minikube using the command into terminal which is using administrative priviledge
```
choco install minikube --force
``` 
looking at the picture below it shows that we can't install minikube as the command choco is not recognised. This means we have to install chocholatey before installing minikube
![caption](/img/1.install-minikube.jpg)

2. Installing chocolatey by copying and pasting this command below into the powershell adminstration priviledge. After installing close the terminal and open again
```
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

```
![caption](/img/2.install-chocolatey.jpg)

3. Then now the minikube is installed successfully
![caption](/img/3.installing-minikube-sucess.jpg)


## Installing Minikube in Linux
Here is the extracted text from the image:

---

## **Installing Minikube on Linux**

> For Linux users, we will install minikube
> (Launch the terminal with administrative access)

We need to install Docker as a driver for minikube and also for minikube to pull base images for the Kubernetes cluster.

```bash
sudo apt-get update
```

This is the command that refreshes the package list on Debian-based systems, ensuring the latest software information is available for installation.

```bash
sudo apt-get install ca-certificates curl gnupg
```

This command installs essential packages including certificate authorities, a data transfer tool (curl), and the GNU Privacy Guard for secure communication and package verification.

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

The command above creates a directory (`/etc/apt/keyrings`) with specific permissions (0644) for storing keyring files, which are used for docker’s authentication.

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

This downloads the Docker GPG key using `curl`.

```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Set read permissions for all users on the Docker GPG key file within the APT keyring directory.

Add the repository by APT source:

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

The `echo` command creates a Docker APT repository configuration entry for Ubuntu systems, incorporating the system architecture and Docker GPG key, and then `sudo tee /etc/apt/sources.list.d/docker.list > /dev/null` writes this configuration to the `/etc/apt/sources.list.d/docker.list` file.

```bash
sudo apt-get update
```

Update list version of docker.

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Verify that Docker has been successfully installed.

```bash
sudo systemctl status docker
```

### ✅ Test

```bash
docker -v
```

### 🔽 Install Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64.deb
```

If you get an error after running the command above, reach out to the technical support.

```bash
sudo dpkg -i minikube-linux-amd64.deb
```
To start minikube
```
minikube start --driver=docker 

```
Kubectl is the CLI tools for interacting with and managing Kubernetes clusters, allowing users to deploy, inspect and manage applications within the Kubernetes environment.

```
sudo snap install kubectl --classic

```

## Installing Minikube on Mac
1. 
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64

```

2. 
```
sudo install minikube-darwin-amd64 /usr/local/bin/minikube


```

3. Just like windows and linux we need docker desktop as driver for minikube. To install docker desktop for mac
[docker desktop](https://docs.docker.com/desktop/setup/install/mac-install/)
```
minikube start --driver=docker

```


## 🔧 **Project Summary: Deploying a Flask App on Minikube (Docker Driver)**

### 📁 **Project Goal:**

Deploy a Flask application inside a Docker container, expose it using Kubernetes via a `NodePort` service, and access it through Minikube.

---

## ✅ **Key Steps Taken**

### 1. **Docker Image Creation**

* **Dockerfile** used to containerize a Flask app.
* Built image locally:

  ```bash
  docker build -t flask-app:latest .
  ```
  ![caption](/img/13.build-docker.jpg)


### 2. **Minikube Setup**
* Start the Minikube with Docker driver. For my project I got an error which is related to Networking and DNS issues
```
minikube start --driver=docker

```
![caption](/img/8.error-docker.jpg)
### 3. **Minikube Setup**

* Started Minikube with Docker driver and DNS fix:

  ```bash
  minikube start --driver=docker --docker-opt dns=1.1.1.1
  ```

* Faced networking & DNS resolution issues inside containers:

  * Errors pulling images from Docker Hub and Python images (`TLS handshake timeout`, `context deadline exceeded`).
  * Fixed via DNS override and possibly network stabilization.

---

### 3. **Kubernetes Resources**

#### 🧱 Deployment

* A `Deployment` was created to run the `flask-app` image.
* Initial pod failed with:

  ```
  ErrImageNeverPull
  ```
  ![caption](/img/17.pod-fail.jpg)

#### 🔄 Resolution:

* The image `flask-app:latest` was local and not in Docker Hub.
* Fixed it by:

  ```bash
  minikube image load flask-app:latest
  ```


  And/or:

  * Setting `imagePullPolicy: Never` in the Deployment YAML.

  * then use this command
  ```
  kubectl get svc flask-service -o yaml

  ```

> **Get the full YAML configuration of the Kubernetes service named `flask-service` and print it to the terminal.**

---

### 🔍 Breakdown of the Command:

| Part            | Meaning                                                               |
| --------------- | --------------------------------------------------------------------- |
| `kubectl`       | The command-line tool to interact with Kubernetes clusters.           |
| `get`           | Command to retrieve Kubernetes resources.                             |
| `svc`           | Short for `service`, a Kubernetes resource type.                      |
| `flask-service` | The name of the service you want to inspect.                          |
| `-o yaml`       | Output the result in YAML format (instead of the default table view). |

---

### ✅ Why Use `-o yaml`?

This gives you **detailed and structured information**, including:

* Service metadata (name, namespace, labels, annotations)
* Service specification (`type`, `selector`, `ports`, `clusterIP`)
* Internal IPs and port mappings
* Useful when debugging or backing up configurations
* Allows you to modify and reapply it using `kubectl apply -f`

#### 🌐 Service

* A `NodePort` service exposed port 5000 on the cluster:

  ```bash
  minikube service flask-service
  ```
  ![caption](/img/15.flask-service.jpg)

  Resulted in external access like:

  ```
  http://192.168.49.2:30500
  ```

  And will locally open in a browser using localhost ip
  ![caption](/img/16.display-web.jpg)

---

## ⚠️ **Key Issues Faced and Fixed**

| Issue                           | Cause                                       | Fix                                                    |
| ------------------------------- | ------------------------------------------- | ------------------------------------------------------ |
| `ErrImageNeverPull`             | Kubernetes couldn't pull local Docker image | Used `minikube image load` or `imagePullPolicy: Never` |
| Docker pull timeouts            | Network/DNS problems                        | Used `--docker-opt dns=1.1.1.1`                        |
| Minikube failing on first start | Registry access blocked                     | Ensured working DNS and connectivity                   |
| Service unreachable             | Pod wasn't running                          | Fixed image issue, then restarted pod                  |

---

## 📌 **Commands Used Frequently**

```bash
# Build and load image
docker build -t flask-app:latest .
minikube image load flask-app:latest

# Start minikube with DNS workaround
minikube start --driver=docker --docker-opt dns=1.1.1.1

# Apply deployment and service
kubectl apply -f flask-deployment.yaml
kubectl apply -f flask-service.yaml

# Access service
minikube service flask-service

# Check pod status
kubectl get pods --show-labels


# Delete minikube
minikube delete
```

---






