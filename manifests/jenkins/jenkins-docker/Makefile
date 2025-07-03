# Makefile para construir, versionar y desplegar imagen Jenkins personalizada

IMAGE_NAME=jenkins-helm
VERSION=v0.1.1
REGISTRY=localhost:5000
CLUSTER_NAME=devops-ai
HELM_VALUES=../../helm-jenkins/values.yaml
ARGO_APP_NAME=jenkins

.PHONY: all build tag push load update-values sync release run

all: build load

build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

tag:
	docker tag $(IMAGE_NAME):$(VERSION) $(REGISTRY)/$(IMAGE_NAME):$(VERSION)

push: tag
	docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION)

load:
	kind load docker-image $(IMAGE_NAME):$(VERSION) --name $(CLUSTER_NAME)

update-values:
	sed -i "s/^ *image: .*/  image: $(REGISTRY)\/$(IMAGE_NAME)/" $(HELM_VALUES)
	sed -i "s/^ *tag: .*/  tag: $(VERSION)/" $(HELM_VALUES)

sync:
	argocd app sync $(ARGO_APP_NAME)

release: build load update-values sync
	@echo "✅ Jenkins personalizado desplegado con éxito: $(IMAGE_NAME):$(VERSION)"

run:
	docker run -p 8080:8080 -p 50000:50000 $(IMAGE_NAME):$(VERSION)
