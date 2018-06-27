all: push

TAG = 0.6
PREFIX = envisia/keepalived
BUILD_IMAGE = build-keepalived

container: keepalived
	docker build --pull -t $(PREFIX):$(TAG) .

keepalived:
	docker build --pull -t $(BUILD_IMAGE):$(TAG) build
	docker create --name $(BUILD_IMAGE) $(BUILD_IMAGE):$(TAG) true
	# docker cp semantics changed between 1.7 and 1.8, so we cp the file to cwd and rename it.
	docker cp $(BUILD_IMAGE):/keepalived.tar.gz .
	docker rm -f $(BUILD_IMAGE)

push: container
	docker push $(PREFIX):$(TAG)

clean:
	rm -f kube-keepalived-vip
