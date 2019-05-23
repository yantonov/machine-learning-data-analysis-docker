help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)
CONTAINER_SRC=/src
JUPITER_PORT=8888

IMAGE=yantonov/machine-learning-data-analysis

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

notebook:
	docker run \
			--hostname localhost \
			-i -t \
			-p 8888:$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			/bin/bash -c \
			"/opt/conda/bin/jupyter notebook \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser"

lab:
	docker run \
			--hostname localhost \
			-i -t \
			-p 8888:$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			/bin/bash -c \
			"/opt/conda/bin/jupyter lab \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser"

ssh:
	docker run --rm -u 0 -t -i -v "$(SRC):/opt/notebooks" "$(IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
