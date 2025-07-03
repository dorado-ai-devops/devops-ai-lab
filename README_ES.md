# 🧪 devops-ai-lab

Repositorio central para simular entornos DevOps modernos con inteligencia artificial integrada en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts Helm y generación de pipelines desde descripciones en lenguaje natural.

Este entorno se ejecuta completamente en local, utilizando Kubernetes con Kind, Jenkins, ArgoCD y microservicios de IA desplegados de forma modular.

---

## 🧱 Componentes Principales

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis inteligente de logs de Jenkins, Kubernetes y pipelines CI/CD usando LLMs.

- 🧠 `ollama`  
  Despliegue de modelos LLM locales como LLaMA3 o Phi-3 para inferencias offline.  
  Compatible con `ai-log-analyzer-devops`.

- 📦 `helm-linter-ai` *(próximamente)*  
  Validación semántica y estructural de charts Helm con LLMs.

- ⚙️ `pipeline-ai` *(próximamente)*  
  Generación automática de pipelines CI/CD a partir de texto.

---

## ⚙️ Infraestructura Local

- Kubernetes local con `kind`
- Jenkins (Deployment + PVC)
- ArgoCD con integración GitOps
- Microservicios de IA desplegados como charts Helm
- Soporte completo para despliegue con Helm
- Uso de `values.yaml` externos para flujos GitOps
- Soporte de secretos (por ejemplo, claves OpenAI)
- Pipeline CI/CD trazable vía Jenkins + GitHub

---

## 🔐 Secretos Necesarios

Algunos servicios de IA requieren claves de API (como OpenAI).  
Deben inyectarse de forma segura en el clúster:

```bash
kubectl create secret generic openai-api-secret   --from-literal=OPENAI_API_KEY=sk-xxx   -n devops-ai
```

Este secreto se usa en los `values.yaml` e inyecta las variables al runtime.

---

## 🚀 Despliegue con Helm

`ai-log-analyzer-devops` se despliega mediante Helm.  
El chart se encuentra en:

```
manifests/helm-log-analyzer/
```

Instalación manual:

```bash
helm install log-analyzer ./manifests/helm-log-analyzer -n devops-ai
```

También puede desplegarse mediante **ArgoCD** con esta estructura:

```
manifests/ai-log-analyzer/argocd/
├── app-log-analyzer.yaml   # ArgoCD Application
├── project.yaml            # ArgoCD Project
└── values.yaml             # Valores externos Helm
```

El despliegue de Ollama sigue la misma lógica, con sus propios manifests argocd/helm en:

```
manifests/ollama/
├── kubernetes/   # YAMLs planos
├── argocd/       # App y valores para GitOps

manifests/helm-ollama

```

---

## 📂 Estructura del Repositorio

```
devops-ai-lab/
├── cluster/                   # Configuración del clúster local (Kind)
├── manifests/                 # Manifests para todos los servicios
│   ├── ai-log-analyzer/       # Manifiestos ai-log-analizer argocd + kubernetes
│   ├── helm-log-analyzer/     # Helm despliegue log-analyzer
|   ├── helm-ollama/           # Helm despliegue ollama
│   ├── jenkins/               # Despliegue de Jenkins
│   ├── ollama/                # Manifiestos ollama argocd + kubernetes
├── pipelines/                 # Jenkinsfiles y scripts auxiliares
├── docs/                      # Diagramas y documentación técnica
└── README.md
```

---

## 📌 Estado del Proyecto

- [x] `ai-log-analyzer-devops` funcional y desplegado
- [x] Jenkins CI local integrado
- [x] Despliegue con Helm y GitOps (ArgoCD)
- [x] Microservicio de Ollama desplegable en Kubernetes
- [ ] Linter IA para Helm (`helm-linter-ai`)
- [ ] Generador de pipelines (`pipeline-ai`)

---

## 👤 Mantenido por

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
🔗 [LinkedIn – Daniel Dorado](https://www.linkedin.com/in/doradodaniel/)