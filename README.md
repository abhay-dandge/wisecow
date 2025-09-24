
# 📘 README  

## 🚀 Project Overview  
This repository contains solutions for two problem statements:  

1. **Containerisation and Deployment of Wisecow Application on Kubernetes**  
2. **Linux Automation Scripts (System Health Monitoring & Log Analyzer)**  

Both problem statements focus on **DevOps practices**, **containerisation**, **Kubernetes deployment**, and **automation using scripts & CI/CD pipelines**.  

---

## 📌 Problem Statement 1: Containerisation and Deployment of Wisecow Application on Kubernetes  

### 🎯 Objective  
To containerize and deploy the **Wisecow application** from [this repository](https://github.com/nyrahul/wisecow) into a Kubernetes environment, automate builds and deployments using **Jenkins & GitHub Actions/Jenkins**, and optionally enable **TLS for secure communication**.  

### 🔑 Requirements  
- **Dockerization**  
  - Create a `Dockerfile` to containerize the Wisecow application.  
  - Push the image to a container registry (Docker Hub / GHCR / ECR).  

- **Kubernetes Deployment**  
  - Write Kubernetes manifests for:  
    - `Deployment` (Pod management)  
    - `Service` (expose application)  
    - `namespace` (optional)  

- **CI/CD**  
  - Jenkins pipeline to build & push Docker image.   

### 📦 Deliverables  
- `Dockerfile`  
- `Manifest/` folder with manifest files (`deployment.yaml`, `service.yaml`, `namespace.yaml`)  
- `Jenkins_pipeline.yml`   
- Documentation on setup & deployment  

---

## 📌 Problem Statement 2: Linux Automation Scripts  

### 🎯 Objective  
Develop automation scripts for monitoring Linux systems and analyzing server logs.  

### 🔑 Requirements  

1. **System Health Monitoring Script**  
   - Monitor CPU, memory, disk usage, and running processes.  
   - Define thresholds (e.g., CPU > 80%).  
   - Generate alerts in console or log file.  

2. **Log File Analyzer Script**  
   - Parse Apache/Nginx logs.  
   - Extract:  
     - Count of `404 errors`  
     - Most requested pages  
     - Top IPs by request volume  
   - Output a summarized report.  

### 📦 Deliverables   
- Sample log files & generated reports  

---

## ⚙️ Tech Stack  
- **Containers**: Docker  
- **Orchestration**: Kubernetes  
- **CI/CD**: Jenkins, GitHub Actions  
- **Monitoring & Analysis**: Bash / Python scripts  

---

## 🏗️ Repository Structure  

wisecow/
├── Dockerfile
├── LICENSE
├── Manifest
│   ├── deployment.yml
│   ├── namespace.yml
│   └── svc.yml
├── README.md
└── wisecow.sh


