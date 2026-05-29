##@ 🐳 Docker

# Image URL to use all building/pushing image targets
IMG ?= fra.ocir.io/boscolocloud/gko
TAG ?= 4.11.7-custom

# DEV

.PHONY: docker-build
docker-build: ## Build docker image with the manager.
	podman build -t ${IMG}:${TAG} .

.PHONY: docker-push
docker-push: ## Push docker image with the manager.
	podman push ${IMG}:${TAG}

docker-build-debug: ## Build docker image with remote debug enabled
	podman build -f Dockerfile.debug -t ${IMG}:${TAG} .

docker-build-cover: ## Build docker image with coverage enabled on binary
	podman build -f Dockerfile.cover -t ${IMG}:${TAG} .
