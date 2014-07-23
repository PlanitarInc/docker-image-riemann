# XXX no versioning of the docker image

.PHONY: build push clean test

build:
	docker build -t planitar/riemann .

push:
	docker build planitar/riemann

clean:
	docker rmi -f planitar/riemann

test:
