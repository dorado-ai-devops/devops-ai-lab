# 🧪 devops-ai-lab

Repositorio central para simular entornos DevOps modernos con inteligencia artificial integrada en tareas clave de CI/CD. Incluye componentes funcionales para análisis de logs, validación de charts Helm, generación de pipelines CI/CD y un gateway API para orquestación de microservicios.

Este entorno se ejecuta íntegramente de forma local usando Kubernetes con Kind, Jenkins, ArgoCD y microservicios de IA modulares.

---

## 🧱 Componentes principales

- 🔍 **ai-log-analyzer**  
  Análisis inteligente de logs para Jenkins, Kubernetes y pipelines CI/CD usando LLMs (API remota de OpenAI y servidor local Ollama).

- 📦 **ai-helm-linter**  
  Validación semántica y estructural de charts Helm usando LLMs.  
  - Valida `Chart.yaml`, `values.yaml` y `templates/*`  
  - Audita sintaxis, coherencia y buenas prácticas de seguridad  
  - Hace fallback a OpenAI cuando los modelos locales (Ollama) no pueden manejar casos complejos

- 🧠 **ai-ollama**  
  Servidor LLM local desplegado en el clúster para inferencia de IA offline (modelos como LLaMA3, Phi-3).

- ⚙️ **ai-pipeline-gen**  
  Generación automática de pipelines CI/CD (Jenkinsfiles) a partir de especificaciones en lenguaje natural.

- 🔌 **ai-gateway**  
  Gateway API basado en Flask que enruta peticiones a varios microservicios de IA (log analyzer, helm linter, pipeline generator).

- 🧩 **ai-mcp-server**  
  Servicio FastAPI para trazabilidad simbólica, recibe mensajes desde Jenkins y los convierte en mensajes MCP auditablemente visualizables.

- 📊 **streamlit-dashboard**  
  Interfaz Streamlit para mostrar prompts/respuestas/MCP en modo auditable, con filtros y SQLite para trazabilidad.

---

## ⚙️ Infraestructura local

- **Kind** para el clúster Kubernetes local  
- **Jenkins** para la ejecución de CI  
- **ArgoCD** para despliegues GitOps  
- **Helm** charts para cada microservicio  
- **Externalización** de `values.yaml` para flujos GitOps  
- **Soporte de secretos** para claves de API de OpenAI  
- Pipelines CI/CD **trazables** vía Jenkins + integración con GitHub

---

## 🔐 Secretos necesarios

Almacena las credenciales de los servicios de IA de forma segura en el clúster. Por ejemplo:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-<TU_CLAVE> \
  -n devops-ai
```

---

## 🚀 Despliegue con Helm y ArgoCD

### Charts de Helm

Los charts se encuentran bajo `manifests/helm-*`, por ejemplo:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ai-mcp/
manifests/helm-ollama/
```

Instalación manual:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### GitOps con ArgoCD

Las apps de ArgoCD están en `manifests/<servicio>/argocd/`. Estructura de ejemplo:

```
manifests/ai-gateway/argocd/
  ├── app-gateway.yaml
  ├── project.yaml
  └── values.yaml
```

Sincronizar con ArgoCD:

```bash
argocd app sync ai-helm-linter
```

---

## 📂 Estructura del proyecto

```
devops-ai-lab/
├── cluster/                   # Configs del clúster Kind
├── docs/                      # Diagramas de arquitectura y docs de diseño
├── images/                    # Diagramas e imágenes
├── manifests/
│   ├── ai-gateway/
│   ├── ai-helm-linter/
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   ├── helm-*/               # Charts de Helm por servicio
│   └── jenkins/               # Jenkins charts y config
├── pipelines/                 # Jenkinsfiles por microservicio
│   ├── test-ai-gateway/
│   ├── test-ai-helm-linter/
│   └── test-ai-log-analyzer/
├── README.md                  # Este archivo
├── README_ENG.md
├── README_ES.md
└── LICENSE
```

---

## 🧪 Pipelines incluidos

Cada microservicio tiene su Jenkinsfile de test, que llama al `ai-gateway` con inputs reales y valida el resultado:

- `test-ai-gateway/Jenkinsfile`: smoke test de gateway y latencia
- `test-ai-helm-linter/Jenkinsfile`: linteo básico de Helm Chart ejemplo
- `test-ai-log-analyzer/Jenkinsfile`: análisis de log fallido (build error) y diagnóstico

Todos los tests se pueden extender fácilmente con inputs reales.

---

## 📌 Estado del proyecto

- [x] ai-log-analyzer  
- [x] ai-helm-linter  
- [x] ai-pipeline-gen  
- [x] ai-gateway
- [x] ai-mcp-server   
- [x] ai-ollama  
- [x] helm + ArgoCD por microservicio  
- [x] integración Jenkins + LLM  
- [ ] streamlit-dashboard (en desarrollo)  


---

## 👤 Mantenedor

[@dorado-ai-devops](https://github.com/dorado-ai-devops)  
Ingeniero DevOps enfocado en integración práctica de IA en flujos CI/CD
