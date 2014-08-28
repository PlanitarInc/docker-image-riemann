# XXX no versioning of the docker image

ifneq ($(NOCACHE),)
  NOCACHEFLAG=--no-cache
endif

.PHONY: build push clean test

build:
	docker build ${NOCACHEFLAG} -t planitar/riemann .

push:
	docker push planitar/riemann

clean:
	docker rmi -f planitar/riemann || true

test:
