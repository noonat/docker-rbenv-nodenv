IMAGE ?= noonat/rbenv-nodenv

build:
	docker build -t $(IMAGE) .

run:
	docker run --rm -it $(IMAGE)

.PHONY: build run
