SENSU_URL ?= "http://localhost:4567"
BASIC_AUTH_USER_PASSWORD ?= ""

build:
	docker build -t sensu-monitoring-app --build-arg SENSU_URL=$(SENSU_URL) --build-arg BASIC_AUTH_USER_PASSWORD=$(BASIC_AUTH_USER_PASSWORD) .

run: build
	docker run --rm -ti -p 8100:8100 -p 35729:35729 sensu-monitoring-app

.PHONY: build run
