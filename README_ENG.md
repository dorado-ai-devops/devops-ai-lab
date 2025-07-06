# 🧪 devops-ai-lab

Central repository for simulating modern DevOps environments with integrated artificial intelligence in key CI/CD tasks. Includes functional components for log analysis, Helm chart validation, CI/CD pipeline generation, and an API gateway for orchestrating microservices.

This environment runs entirely locally using Kubernetes with Kind, Jenkins, ArgoCD, and modular AI microservices.

---

## 🧱 Main Components

- 🔍 **ai-log-analyzer**  
  Intelligent log analysis for Jenkins, Kubernetes, and CI/CD pipelines using LLMs (OpenAI remote API and local Ollama server).

- 📦 **ai-helm-linter**  
  Semantic and structural validation of Helm charts using LLMs.  
  - Validates `Chart.yaml`, `values.yaml`, and `templates/*`  
  - Audits syntax, coherence, and security best practices  
  - Falls back to OpenAI when local models (Ollama) can’t handle complex cases

- 🧠 **ai-ollama**  
  Local LLM server deployed in-cluster for offline AI inference (models like LLaMA3, Phi-3).

- ⚙️ **ai-pipeline-gen**  
  Automatic generation of CI/CD pipelines (Jenkinsfiles) from natural language specifications.

- 🔌 **ai-gateway**  
  Flask-based API gateway that routes requests to various AI microservices (log analyzer, helm linter, pipeline generator).

- 🧩 **ai-mcp-server**  
  FastAPI service for traceability. Receives messages from Jenkins and transforms them into auditable MCP messages.

- 📊 **streamlit-dashboard**  
  Streamlit interface to display prompts/responses/MCP data in an auditable way, with filters and SQLite-based traceability.

---

## ⚙️ Local Infrastructure

- **Kind** for local Kubernetes cluster  
- **Jenkins** for CI execution  
- **ArgoCD** for GitOps deployments  
- **Helm** charts for each microservice  
- **Externalized** `values.yaml` for GitOps flows  
- **Secret support** for OpenAI API keys  
- **Traceable CI/CD pipelines** via Jenkins + GitHub integration

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

Charts are under `manifests/helm-*`, for example:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ai-mcp/
manifests/helm-ollama/
```

Manual installation:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### GitOps with ArgoCD

ArgoCD apps are in `manifests/<service>/argocd/`. Example:

```
manifests/ai-gateway/argocd/
  ├── app-gateway.yaml
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
├── images/                    # Visual diagrams
├── manifests/
│   ├── ai-gateway/
│   ├── ai-helm-linter/
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   ├── helm-*/               # Helm charts per service
│   └── jenkins/               # Jenkins config and Helm
├── pipelines/                 # Jenkinsfiles per microservice
│   ├── test-ai-gateway/
│   ├── test-ai-helm-linter/
│   └── test-ai-log-analyzer/
├── README.md
├── README_ENG.md
├── README_ES.md
└── LICENSE
```

---

## 🧪 Included Pipelines

Each microservice has a Jenkinsfile test that calls `ai-gateway` with real inputs and validates the result:

- `test-ai-gateway/Jenkinsfile`: gateway smoke test and latency
- `test-ai-helm-linter/Jenkinsfile`: basic Helm chart linting
- `test-ai-log-analyzer/Jenkinsfile`: error log diagnosis

All tests can be easily extended with real inputs.

---

## 📌 Project Status

- [x] ai-log-analyzer  
- [x] ai-helm-linter  
- [x] ai-pipeline-gen  
- [x] ai-gateway  
- [x] ai-ollama  
- [x] helm + ArgoCD for each microservice  
- [x] Jenkins + LLM integration  
- [x] ai-mcp-server  
- [ ] streamlit-dashboard (in development)  

---

## 👤 Maintainer

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
DevOps Engineer focused on practical integration of AI into CI/CD pipelines