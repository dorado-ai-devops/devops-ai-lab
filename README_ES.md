# 🧠 devops-ai-lab

Solución modular y local para llevar la IA real a pipelines CI/CD: orquesta, automatiza y audita tareas clave de DevOps con agentes inteligentes y microservicios especializados.

Repositorio modular para **integrar inteligencia artificial en pipelines CI/CD y flujos DevOps modernos**.\
Aborda desde la raíz la integración práctica de LLMs y agentes IA en DevOps, con separación estricta entre razonamiento (LangChain Agent) y microservicios funcionales independientes. Infraestructura 100% local: Kubernetes (Kind), Jenkins, ArgoCD y microservicios IA plug&play.

---

## 🚦 Componentes principales

- **ai-agent** (LangChain)\
  *Cerebro central de reasoning y orquestación IA*. Gestiona el flujo de peticiones y decide qué herramienta o microservicio invocar en cada caso.

- **ai-log-analyzer**\
  Análisis inteligente de logs (Jenkins, Kubernetes, pipelines CI/CD) con modelos LLM (Ollama local/OpenAI remoto). Detección automatizada de causas de fallo y sugerencias de remediación.

- **ai-helm-linter**\
  Validación semántica y estructural de charts Helm. Audita sintaxis, seguridad y mejores prácticas usando IA.

- **ai-pipeline-gen**\
  Generador automático de Jenkinsfiles a partir de lenguaje natural. Traduce requisitos en pipelines CI/CD funcionales.

- **ai-gateway**\
  *Router Flask*. Unifica y expone los endpoints de todos los microservicios IA. Centraliza validaciones y logging de llamadas.

- **ai-mcp-server**\
  Servicio FastAPI para trazabilidad simbólica. Recibe mensajes de Jenkins/gateway y los almacena para visualización y auditoría.

- **streamlit-dashboard**\
  Interfaz visual basada en Streamlit para explorar prompts, respuestas y trazas MCP. Filtros, búsqueda y descarga.

---

## 📂 Estructura del proyecto

```
devops-ai-lab/
├── cluster/                   # Configs del clúster Kind
├── docs/                      # Diagramas y documentación técnica
├── images/                    # Diagramas e imágenes
├── manifests/
│   ├── ai-agent/
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

## ⚙️ Infraestructura local

- **Kind** para el clúster Kubernetes local.
- **Jenkins** para la ejecución de CI.
- **ArgoCD** para despliegues GitOps.
- **Helm** charts para cada microservicio.
- **Externalización** de valores y secretos (API keys, tokens).
- **Pipelines CI/CD** trazables vía Jenkins + integración con GitHub.

---

## 🔐 Secretos necesarios

Guarda tus credenciales (ejemplo OpenAI) de forma segura:

```bash
kubectl create secret generic openai-api-secret \
  --from-literal=OPENAI_API_KEY=sk-<TU_CLAVE> \
  -n devops-ai
```

---

## 🚀 Despliegue con Helm y ArgoCD

### Charts de Helm

Los charts están bajo `manifests/helm-*`:

```
manifests/helm-ai-gateway/
manifests/helm-ai-helm-linter/
manifests/helm-ai-pipeline-gen/
manifests/helm-ai-mcp/
manifests/helm-ollama/
```

Instalación ejemplo:

```bash
helm install ai-helm-linter manifests/helm-ai-helm-linter --namespace devops-ai
```

### GitOps con ArgoCD

Apps ArgoCD en `manifests/<servicio>/argocd/`:

```
manifests/ai-gateway/argocd/
  ├── app-gateway.yaml
  ├── project.yaml
  └── values.yaml
```

Sincronizar:

```bash
argocd app sync ai-helm-linter
```


---

## 🧪 Pipelines incluidos

Cada microservicio tiene su Jenkinsfile de test, que llama al `ai-gateway` con inputs reales y valida el resultado:

- `test-ai-gateway/Jenkinsfile`: smoke test de gateway y latencia.
- `test-ai-helm-linter/Jenkinsfile`: linteo básico de Helm Chart ejemplo.
- `test-ai-log-analyzer/Jenkinsfile`: análisis de log fallido (build error) y diagnóstico.

Todos los tests son extendibles con inputs reales.

---

## 📌 Estado del proyecto

-

---

## 🧠 Notas de arquitectura

- **Reasoning centralizado:** El reasoning y la toma de decisiones IA están siempre dentro del agente LangChain, nunca en microservicios externos.
- **Microservicios atómicos:** Cada microservicio realiza solo tareas concretas y especializadas (análisis, linteo, generación, inferencia LLM).
- **Trazabilidad y auditoría:** Todos los prompts, respuestas y mensajes MCP quedan almacenados para análisis y visualización.
- **Despliegue modular:** Todo es plug&play, actualizable y desacoplado. No requiere cloud ni dependencias externas para operar localmente.
- **Observabilidad y monitorización:** El sistema está preparado para el registro estructurado de logs, métricas y eventos críticos para un seguimiento real en producción.

---

## 👤 Mantenedor

[@dorado-ai-devops](https://github.com/dorado-ai-devops)\
Ingeniero DevOps enfocado en integración práctica de IA en flujos CI/CD

