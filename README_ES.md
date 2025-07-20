# 🧠 devops-ai-lab

Solución modular y local p├── cluster/                   # Configs del clúster Kind
│   └── nvidia/               # Config NVIDIA device plugin
├── docs/                      # Diagramas y documentación técnica
├── images/                    # Diagramas e imágenes
├── manifests/
│   ├── ai-agent/             # Agente LangChain
│   ├── ai-gateway/           # Router API
│   ├── ai-helm-linter/       # Validador de charts
│   ├── ai-instant-ngp/       # Entrenador NeRF
│   ├── ai-colmap-init/       # Inicializador datasets
│   ├── ai-monitoring/        # Stack monitorización
│   │   ├── prometheus/       # Servidor de métricas
│   │   ├── dcgm-exporter/   # Exportador NVIDIA
│   │   └── grafana/         # Dashboards GPU
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   ├── helm-*/               # Charts de Helm por servicio
│   └── jenkins/              # Jenkins charts y configal a pipelines CI/CD: orquesta, automatiza y audita tareas clave de DevOps con agentes inteligentes y microservicios especializados.

Repositorio modular para **integrar inteligencia artificial en pipelines CI/CD y flujos DevOps modernos**.\
Aborda desde la raíz la integración práctica de LLMs y agentes IA en DevOps, combinando automatización inteligente con tareas aceleradas por GPU como entrenamiento NeRF. Implementa una separación estricta entre razonamiento (LangChain Agent) y microservicios funcionales independientes. Infraestructura 100% local: Kubernetes (Kind), Jenkins, ArgoCD, tareas CUDA y microservicios IA plug&play.

---

## 🚦 Componentes principales

- **ai-agent** (LangChain)\
  *Cerebro central de reasoning y orquestación IA*. Gestiona el flujo de peticiones y decide qué herramienta o microservicio invocar en cada caso.

- **ai-instant-ngp**\
  Entrenador NeRF acelerado por CUDA usando Instant-NGP de NVIDIA. Se despliega como Jobs de Kubernetes para generación automatizada de modelos 3D a partir de datasets de imágenes. Optimizado para alto rendimiento con GPUs NVIDIA.

- **ai-colmap-init**\
  Inicializador de datasets NeRF. Procesa conjuntos de imágenes usando COLMAP para generar el archivo `transforms.json` necesario para el entrenamiento. Automatiza la reconstrucción de parámetros de cámara y poses 3D.

- **ai-monitoring**\
  Stack de monitorización GPU con Prometheus + NVIDIA DCGM. Recolecta métricas detalladas de uso de GPU, memoria CUDA, temperatura y rendimiento. Incluye dashboards Grafana preconfigurados y alertas.

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
│   └── nvidia/               # Config NVIDIA device plugin
├── docs/                      # Diagramas y documentación técnica
├── images/                    # Diagramas e imágenes
├── manifests/
│   ├── ai-agent/             # Agente LangChain
│   ├── ai-gateway/           # Router API
│   ├── ai-helm-linter/       # Validador de charts
│   ├── ai-instant-ngp/       # Entrenador NeRF
│   ├── ai-colmap-init/       # Inicializador datasets
│   ├── ai-monitoring/        # Stack monitorización
│   │   ├── prometheus/       # Servidor de métricas
│   │   ├── dcgm-exporter/   # Exportador NVIDIA
│   │   └── grafana/         # Dashboards GPU
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   ├── helm-*/               # Charts de Helm por servicio
│   └── jenkins/              # Jenkins charts y config
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
- **NVIDIA Stack**
  - Device Plugin para acceso a GPUs
  - DCGM Exporter para métricas GPU
  - Prometheus para almacenamiento
  - Grafana para visualización
- **Helm** charts para cada microservicio.
- **Externalización** de valores y secretos (API keys, tokens).
- **Pipelines CI/CD** trazables vía Jenkins + integración con GitHub.
- **Volúmenes Persistentes** para datasets y salidas de modelos.

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

## 🧪 Pipelines y Jobs incluidos

Cada microservicio tiene su Jenkinsfile de test o definición de Job de Kubernetes:

- `test-ai-gateway/Jenkinsfile`: smoke test de gateway y latencia.
- `test-ai-helm-linter/Jenkinsfile`: linteo básico de Helm Chart ejemplo.
- `test-ai-log-analyzer/Jenkinsfile`: análisis de log fallido (build error) y diagnóstico.
- `ai-instant-ngp/job.yaml`: job de entrenamiento NeRF acelerado por GPU.

Los pipelines y jobs son configurables a través de ArgoCD y fácilmente extendibles con inputs reales.

---

## 📌 Estado del proyecto

-

---

## 🧠 Notas de arquitectura

- **Reasoning centralizado:** El reasoning y la toma de decisiones IA están siempre dentro del agente LangChain, nunca en microservicios externos.
- **Microservicios atómicos:** Cada microservicio realiza solo tareas concretas y especializadas (análisis, linteo, generación, inferencia LLM, entrenamiento NeRF).
- **Aceleración GPU:** Soporte para cargas de trabajo CUDA a través de plugins de dispositivos Kubernetes y tareas containerizadas con GPU.
- **Trazabilidad y auditoría:** Todos los prompts, respuestas y mensajes MCP quedan almacenados para análisis y visualización.
- **Despliegue modular:** Todo es plug&play, actualizable y desacoplado. No requiere cloud ni dependencias externas para operar localmente.
- **Observabilidad y monitorización:** El sistema está preparado para el registro estructurado de logs, métricas (incluyendo métricas GPU) y eventos críticos para un seguimiento real en producción.

---

## 👤 Mantenedor

[@dorado-ai-devops](https://github.com/dorado-ai-devops)\
Ingeniero DevOps enfocado en integración práctica de IA en flujos CI/CD

