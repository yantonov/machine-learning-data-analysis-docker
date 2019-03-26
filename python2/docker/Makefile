help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/machine-learning-data-analysis-python2

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

notebook:
	docker run \
			--hostname localhost \
			-i -t \
			-p 8888:8888 \
			-v "$(SRC):/opt/notebooks" \
			--rm \
			"$(IMAGE)" \
			/bin/bash -c \
			"/opt/conda/bin/jupyter notebook \
			--notebook-dir=/opt/notebooks \
			--ip=0.0.0.0 \
			--port=8888 \
			--no-browser"

lab:
	docker run \
			--hostname localhost \
			-i -t \
			-p 8888:8888 \
			-v "$(SRC):/opt/notebooks" \
			--rm \
			"$(IMAGE)" \
			/bin/bash -c \
			"/opt/conda/bin/jupyter lab \
			--notebook-dir=/opt/notebooks \
			--ip=0.0.0.0 \
			--port=8888 \
			--no-browser"

ssh:
	docker run --rm -u 0 -t -i -v "$(SRC):/opt/notebooks" "$(IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
