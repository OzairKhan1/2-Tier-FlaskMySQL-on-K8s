# 🚀 2-Tier DevOps Project – Flask + MySQL  

A complete **2-Tier Application** built with **Flask (Frontend + Backend)** and **MySQL (Database)**, deployed and automated using modern **DevOps tools and practices**.  

This project demonstrates end-to-end **CI/CD, GitOps, Infrastructure as Code (IaC), and Kubernetes orchestration** – a hands-on showcase of cloud-native DevOps.  

---

## 📌 Project Overview  

- **Application Layer (Tier 1):** Flask Web Application (Python)  
- **Database Layer (Tier 2):** MySQL Database  
- **Automation & Cloud:** Docker, Kubernetes (k3s), Jenkins, Argo CD, Terraform, AWS  

The project follows a **GitOps-driven workflow**, where every change in GitHub is automatically built, tested, deployed, and monitored.  

---

## 🛠 Tools & Technologies  

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" width="40" title="GitHub"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg" width="40" title="Jenkins"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="40" title="Docker"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg" width="40" title="Kubernetes"/>
  <img src="https://argo-cd.readthedocs.io/en/stable/assets/logo.png" width="40" title="Argo CD"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" width="40" title="Terraform"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-plain-wordmark.svg" width="50" title="AWS"/>
  <img src="https://cdn-icons-png.flaticon.com/512/561/561127.png" width="40" title="Email Integration"/>
</p>

**Stack Breakdown**  
- **GitHub + Webhooks:** Source Code Hosting & Version Control  
- **Jenkins (with Shared Libraries):** CI/CD Automation Engine  
- **Docker + DockerHub:** Containerization & Image Registry  
- **Kubernetes (k3s):** Cluster Orchestration  
- **Argo CD:** GitOps Continuous Delivery  
- **Terraform:** Infrastructure as Code  
- **AWS:** Cloud Infrastructure Provider  
- **Email Integration:** Smart Alerts & Notifications  

---

## ⚙️ Key Features  

- ✅ Flask web application with MySQL backend  
- ✅ Dockerized and published to DockerHub  
- ✅ Jenkins pipeline for continuous integration and delivery  
- ✅ Kubernetes (k3s) deployment for scalability and resilience  
- ✅ GitOps workflow powered by Argo CD  
- ✅ Infrastructure managed via Terraform on AWS  
- ✅ Email notifications for deployment & monitoring alerts  

---

## 🔄 Workflow  

1. **Developer commits code** → GitHub repo  
2. **Webhook triggers Jenkins** → CI/CD pipeline builds & pushes Docker image to DockerHub  
3. **Terraform provisions AWS infrastructure** (EC2, RDS, etc.)  
4. **Argo CD syncs manifests** from GitHub → Kubernetes cluster (k3s)  
5. **Application deployed** and monitored  
6. **Email alerts** sent on successful/failed deployments  

---

## 📊 Architecture Diagram  

> *(Add an image here if available, e.g., `docs/architecture.png`)*  

# Run with Docker
docker run -p 5000:5000 flask-mysql-app
