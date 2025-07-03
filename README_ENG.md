# 🧪 devops-ai-lab

Central repository for simulating modern DevOps environments with integrated artificial intelligence in key CI/CD tasks. Includes functional components for log analysis, Helm chart validation, CI/CD pipeline generation, and an API gateway for microservices orchestration.

This environment runs entirely locally using Kubernetes with Kind, Jenkins, ArgoCD, and modular AI microservices.

---

## 🧱 Main Components

- 🔍 **ai-log-analyzer**  
  Intelligent log analysis for Jenkins, Kubernetes, and CI/CD pipelines using LLMs (OpenAI remote API & local Ollama server).

- 📦 **ai-helm-linter**  
  Semantic and structural validation of Helm charts using LLMs.  
  - Validates `Chart.yaml`, `values.yaml`, and `templates/*`  
  - Audits syntax, coherence, security best practices  
  - Falls back to OpenAI when local models (Ollama) can’t handle edge cases

- 🧠 **ollama**  
  Local LLM server deployed in-cluster for offline AI inference (models like LLaMA3, Phi-3).

- ⚙️ **ai-pipeline-gen**  
  Automatic generation of CI/CD pipelines (Jenkinsfiles) from natural language specifications.

- 🔌 **ai-gateway**  
  Flask-based API gateway that routes requests to various AI microservices (log analyzer, helm linter, pipeline generator).

---

## ⚙️ Local Infrastructure

- **Kind** for local Kubernetes cluster  
- **Jenkins** for CI execution  
- **ArgoCD** for GitOps deployments  
- **Helm** charts for each microservice  
- **Externalized** `values.yaml` for GitOps workflows  
- **Secrets** support for OpenAI API keys  
- **Traceable** CI/CD pipelines via Jenkins + GitHub integration

---

## 🔐 Required Secrets

Store AI service credentials securely in the cluster. For example:

```bash
kubectl create secret generic openai-api-secret   --from-literal=OPENAI_API_KEY=sk-<YOUR_KEY>   -n devops-ai
```

---

## 🚀 Deployment with Helm & ArgoCD

### Helm Charts

Charts are located under `manifests/helm-*`, for example:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ollama/
```

Install manually:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### ArgoCD GitOps

ArgoCD apps live in `manifests/<service>/argocd/`. Example structure:

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
├── docs/                      # Architecture diagrams, design docs
├── images/                    # Diagrams and screenshots
├── manifests/
│   ├── ai-gateway/
│   │   ├── argocd/            # ArgoCD app manifests
│   │   └── kubernetes/        # Deployment & Service YAMLs
│   ├── ai-helm-linter/
│   │   ├── argocd/
│   │   └── kubernetes/
│   ├── ai-log-analyzer/
│   ├── ai-pipeline-gen/
│   ├── ai-ollama/
│   │   ├── argocd/
│   │   └── kubernetes/
│   ├── helm-ai-gateway/
│   ├── helm-ai-helm-linter/
│   ├── helm-ai-pipeline-gen/
│   ├── helm-ollama/
│   └── jenkins/
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
- [x] Jenkins CI integration  
- [x] ArgoCD GitOps  
- [ ] ai-helm-linter  
- [ ] ai-pipeline-gen  
- [ ] ai-gateway (API router)  

---

## 👤 Maintainer

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps engineer focused on practical AI integration within CI/CD workflows.
