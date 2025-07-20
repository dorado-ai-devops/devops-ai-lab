# 🧠 devops-ai-lab

Modular, local-first solution to bring real AI into CI/CD pipelines: orchestrate, automate, and audit key DevOps tasks with intelligent agents and specialized microservices.

A modular repository to **integrate artificial intelligence into CI/CD pipelines and modern DevOps workflows**.\
Enables practical, local-first LLM and AI agent integration in DevOps, combining intelligent automation with GPU-accelerated tasks like NeRF training. Features strict separation between reasoning (LangChain Agent) and independent functional microservices. 100% local infrastructure: Kubernetes (Kind), Jenkins, ArgoCD, CUDA-enabled tasks, and plug&play AI microservices.

---

## 🚦 Main Components

- **ai-agent** (LangChain)\
  *Central brain for AI reasoning and orchestration.* Manages request flow and decides which tool or microservice to invoke in each case.

- **ai-instant-ngp**\
  CUDA-accelerated NeRF trainer using NVIDIA's Instant-NGP. Deploys as Kubernetes Jobs for automated 3D model generation from image datasets.

- **ai-log-analyzer**\
  Intelligent log analysis (Jenkins, Kubernetes, CI/CD pipelines) with LLMs (local Ollama / remote OpenAI). Automated root cause detection and remediation suggestions.

- **ai-helm-linter**\
  Semantic and structural validation of Helm charts. Audits syntax, security, and best practices using AI.

- **ai-pipeline-gen**\
  Automatic Jenkinsfile generator from natural language. Translates requirements into functional CI/CD pipelines.

- **ai-gateway**\
  *Flask router.* Unifies and exposes all AI microservice endpoints. Centralizes validation and logging of requests.

- **ai-mcp-server**\
  FastAPI service for symbolic traceability. Receives messages from Jenkins/gateway and stores them for visualization and audit.

- **streamlit-dashboard**\
  Streamlit-based visual interface to explore prompts, responses, and MCP traces. Filtering, search, and download.

---

## 📂 Project Structure

```
devops-ai-lab/
├── cluster/                   # Kind cluster configs
├── docs/                      # Architecture diagrams and technical docs
├── images/                    # Diagrams and images
├── manifests/
│   ├── ai-agent/
│   ├── ai-gateway/
│   ├── ai-helm-linter/
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   ├── helm-*/               # Helm charts per service
│   └── jenkins/              # Jenkins charts and config
├── pipelines/                 # Jenkinsfiles per microservice
│   ├── test-ai-gateway/
│   ├── test-ai-helm-linter/
│   └── test-ai-log-analyzer/
├── README.md                  # Main README (Spanish)
├── README_ENG.md              # English README
├── README_ES.md
└── LICENSE
```

---

## ⚙️ Local Infrastructure

- **Kind** for the local Kubernetes cluster.
- **Jenkins** for CI execution.
- **ArgoCD** for GitOps deployments.
- **NVIDIA Device Plugin** for GPU workloads.
- **Helm** charts for each microservice.
- **Externalization** of values and secrets (API keys, tokens).
- **Traceable CI/CD pipelines** via Jenkins + GitHub integration.
- **Persistent Volumes** for datasets and model outputs.

---

## 🔐 Required Secrets

Store your credentials (example OpenAI) securely:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-<YOUR_KEY> \
  -n devops-ai
```

---

## 🚀 Deployment with Helm and ArgoCD

### Helm Charts

Charts are under `manifests/helm-*`:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ai-mcp/
manifests/helm-ollama/
```

Example installation:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### GitOps with ArgoCD

ArgoCD apps in `manifests/<service>/argocd/`:

```
manifests/ai-gateway/argocd/
  ├── app-gateway.yaml
  ├── project.yaml
  └── values.yaml
```

Sync:

```bash
argocd app sync ai-helm-linter
```

---

## 🧪 Included Pipelines and Jobs

Each microservice has its own Jenkinsfile test or Kubernetes Job definition:

- `test-ai-gateway/Jenkinsfile`: smoke test of gateway and latency.
- `test-ai-helm-linter/Jenkinsfile`: basic linting of sample Helm Chart.
- `test-ai-log-analyzer/Jenkinsfile`: analysis of failed log (build error) and diagnosis.
- `ai-instant-ngp/job.yaml`: GPU-accelerated NeRF training job.

The pipelines and jobs are configurable through ArgoCD and easily extendable with real inputs.

---

## 📌 Project Status

-

---

## 🧠 Architecture Notes

- **Centralized reasoning:** All AI reasoning and decision-making is always within the LangChain agent, never in external microservices.
- **Atomic microservices:** Each microservice only performs specific and specialized tasks (analysis, linting, generation, LLM inference, NeRF training).
- **GPU Acceleration:** Support for CUDA-enabled workloads through Kubernetes device plugins and containerized GPU tasks.
- **Traceability and audit:** All prompts, responses, and MCP messages are stored for analysis and visualization.
- **Modular deployment:** Everything is plug&play, upgradable and decoupled. No cloud or external dependencies required to run locally.
- **Observability & Monitoring:** The system supports structured logging, metrics (including GPU metrics), and critical event tracking for real production-grade monitoring.

---

## 👤 Maintainer

[@dorado-ai-devops](https://github.com/dorado-ai-devops)\
DevOps Engineer focused on practical AI integration in CI/CD workflows

