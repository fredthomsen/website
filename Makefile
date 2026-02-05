DOCKER ?= podman

.PHONY: serve
serve:
	$(DOCKER) compose -f .devcontainer/docker-compose.yml up -d

.PHONY: clean
clean:
	$(DOCKER) compose -f .devcontainer/docker-compose.yml down -v

.PHONY: build
build:
	cd src && hugo build --minify && cd ..
