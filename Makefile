.PHONY: build
build: 1

.PHONY: tag
tag: build
	docker tag kylef/swiftenv:1 kylef/swiftenv:latest
	docker tag kylef/swiftenv:1-swift3 kylef/swiftenv:swift3
	docker tag kylef/swiftenv:1-build kylef/swiftenv:build
	docker tag kylef/swiftenv:1-swift3 kylef/swiftenv:swift

.PHONY: push
push: tag
	docker push kylef/swiftenv:1
	docker push kylef/swiftenv:1-swift3
	docker push kylef/swiftenv:1-build
	docker push kylef/swiftenv:latest
	docker push kylef/swiftenv:swift3
	docker push kylef/swiftenv:swift
	docker push kylef/swiftenv:build

.PHONY: 1
1: 1/Dockerfile 1/swift3/Dockerfile 1/build/Dockerfile

.PHONY: 1/Dockerfile
1/Dockerfile:
	cd 1 && docker build -t kylef/swiftenv:1 .

.PHONY: 1/swift3/Dockerfile
1/swift3/Dockerfile:
	cd 1/swift3 && docker build -t kylef/swiftenv:1-swift3 .

.PHONY: 1/build/Dockerfile
1/build/Dockerfile:
	cd 1/build && docker build -t kylef/swiftenv:1-build .

.PHONY: test1
test-1: 1/swift3/Dockerfile
	docker run -it --rm --name swiftenv-swift3-test kylef/swiftenv:1-swift3 swift --version

.PHONY: test
test: test-1
