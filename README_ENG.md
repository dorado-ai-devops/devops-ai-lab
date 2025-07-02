# 🧪 devops-ai-lab

Central repository for simulating modern DevOps environments with integrated artificial intelligence in key CI/CD tasks.  
Includes functional components for log analysis, Helm chart validation, and CI/CD pipeline generation from natural language descriptions.

This environment runs entirely locally, using Kubernetes with Kind, Jenkins, ArgoCD, and modularly deployed AI microservices.

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
- Jenkins (via Deployment + PVC)
- ArgoCD with GitOps integration
- AI microservices deployed as Helm charts
- Helm-based deployment support
- Externalized `values.yaml` for GitOps workflows
- Secrets support for OpenAI API keys
- Fully traceable CI/CD pipeline via Jenkins + GitHub

---

## 🔐 Secrets Required

Some AI services require API keys (e.g., OpenAI) to function. These must be securely stored in the cluster.

Create the required secret before deploying services:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-xxx \
  -n devops-ai
```

This secret is referenced in Helm values and injected as environment variables.

---

## 🚀 Helm Chart Deployment

`ai-log-analyzer-devops` supports Helm-based deployment.  
Charts are located under:

```
manifests/helm-log-analyzer/
```

To install manually:

```bash
helm install log-analyzer ./manifests/helm-log-analyzer -n devops-ai
```

Alternatively, deployment is managed by **ArgoCD** using this structure:

```
manifests/ai-log-analyzer/argocd/
├── app-log-analyzer.yaml   # ArgoCD Application
├── project.yaml            # ArgoCD Project
└── values.yaml             # Externalized Helm values
```

---

## 📂 Repository Structure

```
devops-ai-lab/
├── cluster/              # Local cluster configuration (Kind)
├── manifests/            # Kubernetes manifests for deploying services
├── manifests/helm-log-analyzer/   # Helm chart for ai-log-analyzer
├── manifests/ai-log-analyzer/argocd/  # GitOps with ArgoCD
├── pipelines/            # Jenkinsfiles and integration scripts
├── docs/                 # Diagrams, screenshots, and architecture documentation
└── README.md
```

---

## 📌 Project Status

- [x] Functional and deployed `ai-log-analyzer-devops`
- [x] Local Jenkins CI integration
- [x] Helm-based deployment of `ai-log-analyzer-devops`
- [x] GitOps via ArgoCD
- [ ] AI-based Helm Chart validation (`helm-linter-ai`)
- [ ] Pipeline generation from text (`pipeline-ai`)

---

## 👤 Maintained by

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps engineer focused on practical AI integration within CI/CD environments.
