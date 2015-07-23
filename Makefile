build:
	docker build -t noonat/rbenv-nodenv .

run:
	docker run --rm -it noonat/rbenv-nodenv

.PHONY: build
