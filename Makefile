all: vet test testrace

build:
	go build github.com/xd-luqiang/grpc-go/...

clean:
	go clean -i github.com/xd-luqiang/grpc-go/...

deps:
	GO111MODULE=on go get -d -v github.com/xd-luqiang/grpc-go/...

proto:
	@ if ! which protoc > /dev/null; then \
		echo "error: protoc not installed" >&2; \
		exit 1; \
	fi
	go generate github.com/xd-luqiang/grpc-go/...

test:
	go test -cpu 1,4 -timeout 7m github.com/xd-luqiang/grpc-go/...

testsubmodule:
	cd security/advancedtls && go test -cpu 1,4 -timeout 7m github.com/xd-luqiang/grpc-go/security/advancedtls/...
	cd security/authorization && go test -cpu 1,4 -timeout 7m github.com/xd-luqiang/grpc-go/security/authorization/...

testrace:
	go test -race -cpu 1,4 -timeout 7m github.com/xd-luqiang/grpc-go/...

testdeps:
	GO111MODULE=on go get -d -v -t github.com/xd-luqiang/grpc-go/...

vet: vetdeps
	./vet.sh

vetdeps:
	./vet.sh -install

.PHONY: \
	all \
	build \
	clean \
	proto \
	test \
	testrace \
	vet \
	vetdeps
