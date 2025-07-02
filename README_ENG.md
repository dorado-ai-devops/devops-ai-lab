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
- Helm chart support for `ai-log-analyzer-devops`
- CI integration pipeline in Jenkins connected to GitHub repo
- Secret injection for OpenAI API keys into Kubernetes

---

## 🔐 Secrets Required

> Some AI services require API keys (e.g., OpenAI) to function. These must be stored securely in your local cluster.

Before deploying any AI service that uses external LLMs, you must create the required Kubernetes secret:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-xxx \
  -n devops-ai
```

This secret will be mounted into the pods as environment variables and **must not be committed to version control**.

---

## 📦 Helm Chart Support

`ai-log-analyzer-devops` now supports Helm-based deployment.  
The chart structure aligns with existing manifests and allows for easy integration with GitOps tools like ArgoCD.

To install:

```bash
helm install log-analyzer ./charts/log-analyzer -n devops-ai
```

Helm values are pre-configured for local development (`NodePort`, `IfNotPresent`, `envFrom` for OpenAI secret).

---

## 📂 Repository Structure

```
devops-ai-lab/
├── cluster/              # Local cluster configuration (Kind)
├── manifests/            # Kubernetes manifests for deploying services
├── charts/               # Helm charts for AI services
│   └── log-analyzer/     # Helm chart for ai-log-analyzer
├── pipelines/            # Jenkinsfiles and integration scripts
├── docs/                 # Diagrams, screenshots, and architecture documentation
└── README.md
```

---

## 📌 Project Status

- [x] Functional and deployed `ai-log-analyzer-devops`
- [x] Local Jenkins CI integration
- [x] Helm-based deployment of `ai-log-analyzer-devops`
- [ ] AI-based Helm Chart validation (`helm-linter-ai`)
- [ ] Pipeline generation from text (`pipeline-ai`)

---

## 👤 Maintained by

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps engineer focused on practical AI integration within CI/CD environments.