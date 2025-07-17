IMAGE_NAME     := jenkins-helm
VERSION        := v1.0.0
REGISTRY       := localhost:5000
HELM_VALUES    := ../../helm-jenkins/values.yaml
ARGO_APP_NAME  := jenkins

.PHONY: all build tag push update-values sync release run

all: release

build:
	docker build --no-cache -t $(IMAGE_NAME):$(VERSION) .

tag: build
	docker tag $(IMAGE_NAME):$(VERSION) $(REGISTRY)/$(IMAGE_NAME):$(VERSION)

push: tag
	docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION)

update-values:
	@echo "🔄 Actualizando Helm values para $(IMAGE_NAME)…"
	# Ajusta el repositorio completo incluyendo registry
	sed -i "s|^\(\s*repository:\s*\).*|\1$(REGISTRY)/$(IMAGE_NAME)|" $(HELM_VALUES)
	# Ajusta la etiqueta (tag)
	sed -i "s|^\(\s*tag:\s*\).*|\1\"$(VERSION)\"|"        $(HELM_VALUES)

sync:
	@echo "⏳ Sincronizando ArgoCD (app: $(ARGO_APP_NAME))…"
	argocd app sync $(ARGO_APP_NAME)

release: push update-values sync
	@echo "✅ Jenkins personalizado desplegado con éxito: $(REGISTRY)/$(IMAGE_NAME):$(VERSION)"

run:
	docker run -p 8080:8080 -p 50000:50000 $(REGISTRY)/$(IMAGE_NAME):$(VERSION)
