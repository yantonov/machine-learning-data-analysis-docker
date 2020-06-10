help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)
CONTAINER_SRC=/src

JUPITER_PORT=8888
EXPOSED_JUPITER_PORT?=8888

IMAGE=yantonov/machine-learning-data-analysis-python2
CONTAINER_NAME?=$(shell echo "$(IMAGE)" | tr '/' '_')

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

notebook:
	docker run \
			--hostname localhost \
			-it \
			-p $(EXPOSED_JUPITER_PORT):$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(IMAGE)" \
			"jupyter notebook \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser \
			--allow-root"

lab:
	docker run \
			--hostname localhost \
			-it \
			-p $(EXPOSED_JUPITER_PORT):$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(IMAGE)" \
			"jupyter lab \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser \
			--allow-root"

logs:
	docker logs "$(CONTAINER_NAME)"

ssh:
	docker run --rm -it "$(IMAGE)" /bin/bash

stop:
	docker stop "$(CONTAINER_NAME)"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
