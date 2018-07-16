.PHONY: jarzip-builder jarzip test-builder test

jarzip-builder:
	docker build -t jarzip-builder -f jarzip-builder/Dockerfile .

jarzip: jarzip-builder
	mkdir -p artifacts
	docker run -v ${PWD}/artifacts:/artifacts jarzip-builder

test-builder:
	docker build -t test-builder -f test-builder/Dockerfile .

test: test-builder
	mkdir -p build
	docker run -v ${PWD}/build:/hail/build test-builder
