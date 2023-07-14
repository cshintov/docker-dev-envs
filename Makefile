.PHONY: build run init watch clean

build:
	docker-compose build

run:
	docker-compose run --rm app bash

init:
	docker-compose run --rm app cargo init .

watch:
	docker-compose up -d

clean:
	docker-compose down

deps:
	docker-compose run app cargo build
