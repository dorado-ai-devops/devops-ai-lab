# 🧪 devops-ai-lab

Central repository for simulating modern DevOps environments with integrated artificial intelligence in key CI/CD tasks.  
Includes functional components for log analysis, Helm chart validation, and CI/CD pipeline generation from natural language descriptions.

This environment is designed to run entirely locally, using Kubernetes with Kind, Jenkins, and modularly deployed AI microservices.

---

## 🧱 Main Components

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Intelligent log analysis for Jenkins, Kubernetes, and CI/CD pipelines using LLMs.

- 📦 `helm-linter-ai` *(coming soon)*  
  Semantic and structural validation of Helm charts using LLMs.

- ⚙️ `pipeline-ai` *(coming soon)*  
  Automatic generation of CI/CD pipelines from natural language descriptions.

---

## ⚙️ Local Infrastructure

- Local Kubernetes via `kind`
- Jenkins container
- AI microservices deployed in the cluster
- Compatible with manual testing and real CI automation

---

## 📂 Repository Structure

```
devops-ai-lab/
├── cluster/            # Local cluster configuration (Kind)
├── manifests/          # Kubernetes manifests for deploying AI services
├── pipelines/          # Jenkinsfiles and integration scripts
├── docs/               # Diagrams, screenshots, and architecture documentation
└── README.md
```

---

## 📌 Project Status

- [x] Functional and deployed `ai-log-analyzer-devops`
- [ ] Local Jenkins CI integration
- [ ] AI-based Helm Chart validation (`helm-linter-ai`)
- [ ] Pipeline generation from text (`pipeline-ai`)

---

## 👤 Maintained by

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps engineer focused on practical AI integration within CI/CD environments.