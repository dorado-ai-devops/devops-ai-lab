# 🧪 devops-ai-lab

Central repository to simulate modern DevOps environments with integrated artificial intelligence in key CI/CD tasks. Includes functional components for log analysis, Helm chart validation, CI/CD pipeline generation, and an API gateway for microservice orchestration.

This environment runs entirely locally using Kubernetes with Kind, Jenkins, ArgoCD, and modular AI microservices.

---

## 🧱 Main Components

- 🔍 **ai-log-analyzer**  
  Intelligent log analysis for Jenkins, Kubernetes, and CI/CD pipelines using LLMs (OpenAI remote API and local Ollama server).

- 📦 **ai-helm-linter**  
  Semantic and structural validation of Helm Charts using LLMs.  
  - Validates `Chart.yaml`, `values.yaml`, and `templates/*`  
  - Audits syntax, coherence, and security best practices  
  - Falls back to OpenAI when local models (Ollama) cannot handle edge cases

- 🧠 **ai-ollama**  
  Local LLM server deployed in-cluster for offline AI inference (models like LLaMA3, Phi-3).

- ⚙️ **ai-pipeline-gen**  
  Automatic CI/CD pipeline generation (Jenkinsfiles) from natural language specifications.

- 🔌 **ai-gateway**  
  Flask-based API Gateway routing requests to various AI microservices (log analyzer, helm linter, pipeline generator).

---

## ⚙️ Local Infrastructure

- **Kind** for the local Kubernetes cluster  
- **Jenkins** for CI pipeline execution  
- **ArgoCD** for GitOps-based deployments  
- **Helm** charts for each microservice  
- **Externalized** `values.yaml` for GitOps workflows  
- **Secrets support** for OpenAI API keys  
- Fully traceable CI/CD pipelines via Jenkins + GitHub integration

---

## 🔐 Required Secrets

Store AI service credentials securely in the cluster. Example:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-<YOUR_KEY> \
  -n devops-ai
```

---

## 🚀 Deployment with Helm and ArgoCD

### Helm Charts

Charts are located under `manifests/helm-*`, for example:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ollama/
```

Manual installation:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### GitOps with ArgoCD

ArgoCD apps are located in `manifests/<service>/argocd/`. Example structure:

```
manifests/ai-gateway/argocd/
  ├── app-gateway.yaml
  ├── project.yaml
  └── values.yaml

manifests/ai-helm-linter/argocd/
  ├── app-helm-linter.yaml
  ├── project.yaml
  └── values.yaml
```

Sync with ArgoCD:

```bash
argocd app sync ai-helm-linter
```

---

## 📂 Project Structure

```
devops-ai-lab/
├── cluster/                   # Kind cluster configs
├── docs/                      # Architecture diagrams and design docs
├── images/                    # Diagrams and images
├── manifests/
│   ├── ai-gateway/
│   │   ├── argocd/            # ArgoCD manifests
│   ├── ai-helm-linter/
│   │   ├── argocd/
│   ├── ai-log-analyzer/
│   ├── ai-pipeline-gen/
│   ├── ai-ollama/
│   │   ├── argocd/
│   ├── helm-ai-gateway/
│   ├── helm-ai-helm-linter/
│   ├── helm-ai-pipeline-gen/
│   ├── helm-ollama/
│   └── jenkins/               # Jenkins deployment
├── pipelines/                 # Jenkinsfiles and CI tests
├── README.md                  # This file
├── README_ENG.md
├── README_ES.md
└── LICENSE
```

---

## 📌 Project Status

- [x] ai-log-analyzer  
- [x] ollama (local LLM server)  
- [x] CI integration with Jenkins  
- [x] GitOps via ArgoCD  
- [ ] ai-helm-linter  
- [ ] ai-pipeline-gen  
- [ ] ai-gateway (API router)  

---

## 👤 Maintainer

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps Engineer focused on practical AI integration into CI/CD workflows.
