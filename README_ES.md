
# 🧪 devops-ai-lab

Repositorio central para simular entornos DevOps modernos con inteligencia artificial integrada en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts Helm y generación de pipelines a partir de descripciones en lenguaje natural.

Este entorno está diseñado para ejecutarse completamente en local, utilizando Kubernetes con Kind, Jenkins y microservicios de IA desplegados modularmente.

---

## 🧱 Componentes principales

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis inteligente de logs de Jenkins, Kubernetes y pipelines CI/CD usando LLMs.

- 📦 `helm-linter-ai` *(próximamente)*  
  Validación semántica y estructural de charts Helm mediante modelos de lenguaje.

- ⚙️ `pipeline-ai` *(próximamente)*  
  Generación automática de pipelines CI/CD a partir de descripciones en lenguaje natural.

---

## ⚙️ Infraestructura local

- Kubernetes local usando `kind`
- Contenedor Jenkins
- Microservicios de IA desplegados en el clúster
- Compatible con pruebas manuales y automatización CI real

---

## 📂 Estructura del repositorio

```
devops-ai-lab/
├── cluster/            # Configuración del clúster local (Kind)
├── manifests/          # Manifiestos Kubernetes para desplegar servicios
├── pipelines/          # Jenkinsfiles y scripts de integración
├── docs/               # Diagramas, capturas y documentación técnica
└── README.md
```

---

## 📌 Estado del proyecto

- [x] `ai-log-analyzer-devops` funcional y desplegado
- [ ] Integración local de Jenkins CI
- [ ] Validación de Helm Charts con IA (`helm-linter-ai`)
- [ ] Generador de pipelines desde texto (`pipeline-ai`)

---

## 🔐 Requisitos

Para que el servicio de análisis funcione correctamente, es necesario crear previamente un secreto de Kubernetes con la clave de API de OpenAI:

```bash
kubectl create secret generic openai-api-key   --from-literal=OPENAI_API_KEY=sk-xxx   -n devops-ai
```

---

## 👤 Mantenido por

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps enfocado en la integración práctica de IA en entornos CI/CD.
