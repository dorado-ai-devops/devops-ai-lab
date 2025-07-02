# 🧪 devops-ai-lab

Repositorio central para la simulación de entornos DevOps modernos integrando inteligencia artificial en tareas clave de CI/CD.  
Incluye componentes funcionales para análisis de logs, validación de charts Helm y generación de pipelines a partir de lenguaje natural.

Este entorno está diseñado para ejecutarse completamente en local, utilizando Jenkins, Kubernetes (kind) y servicios IA desarrollados de forma modular.

---

Central repository for simulating modern DevOps environments with integrated artificial intelligence for key CI/CD tasks.  
Includes functional components for log analysis, Helm chart validation, and pipeline generation from natural language descriptions.

Designed to run fully on local environments using Jenkins, Kubernetes (kind), and modular AI services.

---

## 🧱 Componentes principales / Main Components

- 🔍 [`ai-log-analyzer-devops`](https://github.com/dorado-ai-devops/ai-log-analyzer-devops)  
  Análisis de logs de Jenkins, Kubernetes y CI/CD con IA.  
  AI-powered log analyzer for Jenkins, Kubernetes and CI/CD pipelines.

- 📦 `helm-linter-ai` *(próximamente / coming soon)*  
  Validación semántica y estructural de charts Helm mediante LLMs.  
  Semantic and structural Helm chart validation using LLMs.

- ⚙️ `pipeline-ai` *(próximamente / coming soon)*  
  Generación de pipelines CI/CD a partir de descripciones en lenguaje natural.  
  CI/CD pipeline generation from natural language descriptions.

---

## ⚙️ Infraestructura local / Local Infrastructure

- `kind` (Kubernetes in Docker)
- Jenkins (contenedor aislado)
- Servicios IA desplegados como microservicios en local
- Configuración compatible con pruebas manuales y pipelines reales

---

## 📂 Estructura del repositorio / Repository Structure

```
devops-ai-lab/
├── cluster/            # Configuración del clúster local
├── manifests/          # Manifiestos Kubernetes para los servicios IA
├── pipelines/          # Jenkinsfiles y scripts de prueba
├── docs/               # Diagramas, capturas y documentación adicional
└── README.md
```

---

## 📌 Estado del proyecto / Project Status

- [x] `ai-log-analyzer-devops` funcional
- [ ] Integración de Jenkins local
- [ ] Validación IA de Helm Charts
- [ ] Generador de pipelines con prompts

---

## 👤 Mantenido por / Maintained by

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps especializado en integración de IA aplicada a plataformas CI/CD.  
DevOps engineer focused on applied AI integration for CI/CD platforms.

---
