# 🧪 devops-ai-lab

Repositorio central para simular entornos modernos de DevOps con inteligencia artificial integrada en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts de Helm y generación de pipelines CI/CD a partir de descripciones en lenguaje natural.

Este entorno se ejecuta completamente en local, utilizando Kubernetes con Kind, Jenkins, ArgoCD y microservicios de IA desplegados modularmente.

---

## 🧱 Componentes Principales

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis inteligente de logs de Jenkins, Kubernetes y pipelines CI/CD usando LLMs.

- 📦 `helm-linter-ai` *(próximamente)*  
  Validación semántica y estructural de charts Helm mediante LLMs.

- ⚙️ `pipeline-ai` *(próximamente)*  
  Generación automática de pipelines CI/CD a partir de texto natural.

---

## ⚙️ Infraestructura Local

- Kubernetes local mediante `kind`
- Jenkins (con Deployment + PVC)
- ArgoCD con integración GitOps
- Microservicios de IA desplegados como charts Helm
- Soporte para despliegue mediante Helm
- `values.yaml` externalizado para flujos GitOps
- Soporte de secretos para claves API de OpenAI
- Pipeline CI/CD completamente trazable con Jenkins + GitHub

---

## 🔐 Secretos Necesarios

Algunos servicios de IA requieren claves API (por ejemplo, OpenAI) para funcionar. Estas deben almacenarse de forma segura en el clúster.

Crear el secreto requerido antes de desplegar los servicios:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-xxx \
  -n devops-ai
```

Este secreto se referencia en los valores de Helm y se inyecta como variables de entorno.

---

## 🚀 Despliegue con Helm Chart

`ai-log-analyzer-devops` admite despliegue mediante Helm.  
Los charts se encuentran en:

```
manifests/helm-log-analyzer/
```

Para instalar manualmente:

```bash
helm install log-analyzer ./manifests/helm-log-analyzer -n devops-ai
```

Alternativamente, el despliegue se gestiona con **ArgoCD** usando esta estructura:

```
manifests/ai-log-analyzer/argocd/
├── app-log-analyzer.yaml   # Aplicación ArgoCD
├── project.yaml            # Proyecto ArgoCD
└── values.yaml             # Valores Helm externalizados
```

---

## 📂 Estructura del Repositorio

```
devops-ai-lab/
├── cluster/              # Configuración del clúster local (Kind)
├── manifests/            # Manifiestos Kubernetes para desplegar servicios
├── manifests/helm-log-analyzer/   # Chart Helm para ai-log-analyzer
├── manifests/ai-log-analyzer/argocd/  # GitOps con ArgoCD
├── pipelines/            # Jenkinsfiles y scripts de integración
├── docs/                 # Diagramas, capturas y documentación técnica
└── README.md
```

---

## 📌 Estado del Proyecto

- [x] `ai-log-analyzer-devops` funcional y desplegado
- [x] Integración CI local con Jenkins
- [x] Despliegue mediante Helm
- [x] GitOps con ArgoCD
- [ ] Validación de Helm Charts con IA (`helm-linter-ai`)
- [ ] Generación de pipelines desde texto (`pipeline-ai`)

---

## 👤 Mantenido por

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps centrado en la integración práctica de IA en entornos CI/CD.