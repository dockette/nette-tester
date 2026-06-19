DOCKER_IMAGE=dockette/nette-tester
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64

.PHONY: build
build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

.PHONY: test
test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} php --version
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} /srv/tester/vendor/bin/tester --help
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} /srv/tester/vendor/bin/tester -i -p php

.PHONY: run
run:
	docker run --rm -it -v ${PWD}:/srv/app ${DOCKER_IMAGE}:${DOCKER_TAG}
