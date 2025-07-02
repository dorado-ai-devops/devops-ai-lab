# 🧪 devops-ai-lab

Repositorio central para la simulación de entornos DevOps modernos con integración de inteligencia artificial en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts Helm y generación de pipelines a partir de lenguaje natural.

Este entorno está diseñado para ejecutarse completamente en local, utilizando Kubernetes con Kind, Jenkins y microservicios IA desplegados modularmente.

---

## 🧱 Componentes principales

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis inteligente de logs de Jenkins, Kubernetes y CI/CD con modelos LLM.

- 📦 `helm-linter-ai` *(próximamente)*  
  Validación semántica y estructural de charts Helm mediante modelos LLM.

- ⚙️ `pipeline-ai` *(próximamente)*  
  Generación automática de pipelines CI/CD a partir de descripciones en lenguaje natural.

---

## ⚙️ Infraestructura local

- Kubernetes local vía `kind`
- Jenkins en contenedor
- Microservicios IA desplegados en el clúster
- Compatible con pruebas manuales y automatización real vía pipelines

---

## 📂 Estructura del repositorio

```
devops-ai-lab/
├── cluster/            # Configuración del clúster local (Kind)
├── manifests/          # Manifiestos Kubernetes para desplegar los servicios IA
├── pipelines/          # Jenkinsfiles y scripts de integración
├── docs/               # Diagramas, capturas y documentación de arquitectura
└── README.md
```

---

## 📌 Estado del proyecto

- [x] `ai-log-analyzer-devops` funcional y desplegado
- [ ] Integración local de Jenkins CI
- [ ] Validación IA de Helm Charts (`helm-linter-ai`)
- [ ] Generador de pipelines a partir de texto (`pipeline-ai`)

---

## 👤 Mantenido por

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps enfocado en integración práctica de IA en entornos CI/CD.