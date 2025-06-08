THEME:=tella

.PHONY: serve
serve:
	docker compose -f .devcontainer/docker-compose.yml up -d

.PHONY: clean
clean:
	docker compose -f .devcontainer/docker-compose.yml down -v

.PHONY: build
build:
	cd src && hugo build --minify && cd ..
