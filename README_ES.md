# 🧪 devops-ai-lab

Repositorio central para simular entornos DevOps modernos con inteligencia artificial integrada en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts Helm y generación de pipelines CI/CD a partir de descripciones en lenguaje natural.

Este entorno está diseñado para ejecutarse completamente en local, usando Kubernetes con Kind, Jenkins y microservicios de IA desplegados de forma modular.

---

## 🧱 Componentes Principales

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis inteligente de logs para Jenkins, Kubernetes y pipelines CI/CD utilizando LLMs.

- 📦 `helm-linter-ai` *(próximamente)*  
  Validación semántica y estructural de charts Helm con LLMs.

- ⚙️ `pipeline-ai` *(próximamente)*  
  Generación automática de pipelines CI/CD a partir de lenguaje natural.

---

## ⚙️ Infraestructura Local

- Kubernetes local mediante `kind`
- Contenedor Jenkins
- Microservicios de IA desplegados en el clúster
- Compatible con pruebas manuales y automatización CI real
- Soporte de Helm Chart para `ai-log-analyzer-devops`
- Pipeline de integración CI en Jenkins conectado al repo de GitHub
- Inyección de secretos de API (OpenAI) en Kubernetes

---

## 🔐 Secretos Requeridos

> Algunos servicios de IA requieren claves API (por ejemplo, OpenAI) para funcionar. Estas deben almacenarse de forma segura en el clúster local.

Antes de desplegar cualquier servicio que use LLMs externos, crea el secreto correspondiente:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-xxx \
  -n devops-ai
```

Este secreto será montado en los pods como variables de entorno y **no debe subirse al control de versiones**.

---

## 📦 Soporte Helm Chart

`ai-log-analyzer-devops` ahora permite despliegue mediante Helm.  
La estructura del chart es compatible con los manifiestos existentes y facilita la integración con herramientas GitOps como ArgoCD.

Para instalar:

```bash
helm install log-analyzer ./charts/log-analyzer -n devops-ai
```

Los valores están preconfigurados para desarrollo local (`NodePort`, `IfNotPresent`, `envFrom` para el secreto OpenAI).

---

## 📂 Estructura del Repositorio

```
devops-ai-lab/
├── cluster/              # Configuración del clúster local (Kind)
├── manifests/            # Manifiestos de Kubernetes para los servicios
├── charts/               # Helm charts para servicios IA
│   └── log-analyzer/     # Helm chart para ai-log-analyzer
├── pipelines/            # Jenkinsfiles y scripts de integración
├── docs/                 # Diagramas, capturas y documentación de arquitectura
└── README.md
```

---

## 📌 Estado del Proyecto

- [x] `ai-log-analyzer-devops` funcional y desplegado
- [x] Integración CI local con Jenkins
- [x] Despliegue vía Helm de `ai-log-analyzer-devops`
- [ ] Validación de charts Helm con IA (`helm-linter-ai`)
- [ ] Generación de pipelines desde texto (`pipeline-ai`)

---

## 👤 Mantenido por

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps centrado en la integración práctica de IA en entornos CI/CD.