# 🧠 devops-ai-lab


Un repositorio modular para integrar inteligencia artificial en pipelines CI/CD y flujos de trabajo modernos de DevOps.
Permite la integración práctica de LLMs y agentes de IA en DevOps de manera local, combinando automatización inteligente con tareas aceleradas por GPU, como el entrenamiento de NeRF. Presenta una separación estricta entre el razonamiento (LangChain Agent) y microservicios funcionales independientes. Infraestructura 100% local: Kubernetes (k3s), Jenkins, ArgoCD, tareas habilitadas con CUDA y microservicios de IA plug&play.

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

- **ai-vector-db**\
  Base de datos vectorial para almacenar y consultar embeddings de código, logs y documentación. Permite búsquedas semánticas y RAG.

- **ai-chat-ui**\
  Interfaz web para interactuar con el agente LangChain. Soporta historial de conversaciones, contexto persistente y visualización de acciones.

- **streamlit-dashboard**\
  Interfaz visual basada en Streamlit para explorar prompts, respuestas y trazas MCP. Filtros, búsqueda y descarga.

- **ai-dashboard**\
  Dashboard interactivo para visualizar llamadas y acciones del agente y sus correspondientes mensajes mcp. 
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
│   │   └── argocd/          # Configuración ArgoCD
│   ├── ai-chat-ui/          # UI de chat con el agente
│   │   └── argocd/
│   ├── ai-dashboard/        # Dashboard de monitoreo
│   │   └── argocd/
│   ├── ai-gateway/          # Router API
│   │   └── argocd/
│   ├── ai-helm-linter/      # Validador de charts
│   │   └── argocd/
│   ├── ai-instant-ngp/      # Entrenador NeRF
│   │   ├── argocd/
│   │   └── pvc-datos-nerf.yaml
│   ├── ai-monitoring/       # Stack monitorización
│   │   └── argocd/
│   │       ├── app-nvidia-dcgm.yaml
│   │       ├── app-prometheus.yaml
│   │       └── values_nvidia.yaml
│   ├── ai-vector-db/       # Base de datos vectorial
│   │   └── argocd/
│   ├── ai-log-analyzer/
│   ├── ai-mcp-server/
│   ├── ai-ollama/
│   ├── ai-pipeline-gen/
│   └── jenkins/            # Jenkins configuration
├── helm-*/                 # Charts de Helm por servicio
│   ├── Chart.yaml
│   ├── templates/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── _helpers.tpl
│   └── values.yaml
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

Los charts están bajo `helm-*/`:

```
helm-agent/            # Agente LangChain
helm-chat/            # UI de chat
helm-dashboard/       # Dashboard de monitoreo
helm-gateway/         # API Gateway
helm-helm-linter/     # Validador de charts
helm-instant-ngp/     # Entrenador NeRF
helm-jenkins/         # Servidor CI/CD
helm-log-analyzer/    # Analizador de logs
helm-mcp/            # Servidor MCP
helm-nvidia-dcgm/     # Monitoreo GPU
helm-ollama/         # Servidor LLM local
helm-pipeline-gen/    # Generador pipelines
helm-vector-bd/      # Base datos vectorial
```

Cada chart incluye:
- `Chart.yaml`: Metadatos y dependencias
- `values.yaml`: Valores configurables
- `templates/`: Plantillas K8s
  - `deployment.yaml`: Pod specs
  - `service.yaml`: Network services
  - `_helpers.tpl`: Helpers comunes

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

### Stack de Monitorización GPU

El stack de monitorización NVIDIA incluye:

1. **NVIDIA DCGM Exporter**
   ```yaml
   # manifests/ai-monitoring/argocd/app-nvidia-dcgm.yaml
   apiVersion: argoproj.io/v1alpha1
   kind: Application
   metadata:
     name: dcgm-exporter
     namespace: argocd
   spec:
     source:
       repoURL: git@github.com/dorado-ai-devops/devops-ai-lab.git
       path: helm-nvidia-dcgm
   ```
   
2. **Métricas recolectadas:**
   - Uso de GPU (%)
   - Memoria CUDA usada/total
   - Temperatura de GPU
   - Utilización de memoria
   - Fan speed y power usage
   - Errores CUDA/XID

3. **Dashboards Grafana:**
   - Vista general de GPUs
   - Métricas por nodo/GPU
   - Histórico de uso
   - Alertas configurables



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
- **Observabilidad y monitorización:** El sistema está preparado para el registro estructurado de logs, métricas y eventos críticos. Incluye monitorización detallada de GPUs mediante NVIDIA DCGM + Prometheus, dashboards preconfigurados en Grafana y sistema de alertas para rendimiento y salud de GPUs.

---

## 👤 Mantenedor

[@dorado-ai-devops](https://github.com/dorado-ai-devops)\
Ingeniero DevOps enfocado en integración práctica de IA en flujos CI/CD

