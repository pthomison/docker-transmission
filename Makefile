IMAGE=transmission

build:
	docker build . -t pthomison/$(IMAGE):localbuild

RUN_CONTAINER=docker run -it --rm pthomison/$(IMAGE):localbuild

GIT_REV=$(shell git rev-parse --short HEAD)

shell: build
	$(RUN_CONTAINER) /bin/zsh

tag: build
	docker tag pthomison/$(IMAGE):localbuild  pthomison/$(IMAGE):latest
	docker tag pthomison/$(IMAGE):localbuild  pthomison/$(IMAGE):$(GIT_REV)

push: tag
	docker push pthomison/$(IMAGE):latest
	docker push pthomison/$(IMAGE):$(GIT_REV)

clean:
	docker rmi \
		pthomison/$(IMAGE):localbuild \
		pthomison/$(IMAGE):latest
