IMAGE_TAG ?= ethcomsec/cxxrtl-b6

build_docker:
	docker build -t $(IMAGE_TAG) . 2>&1 | tee build.log

run_docker:
	docker run -it $(IMAGE_TAG)
