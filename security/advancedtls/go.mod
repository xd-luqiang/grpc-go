module github.com/dubbogo/grpc-go/security/advancedtls

go 1.14

require (
	github.com/google/go-cmp v0.5.1 // indirect
	github.com/hashicorp/golang-lru v0.5.4
	github.com/dubbogo/grpc-go v1.38.0
	github.com/dubbogo/grpc-go/examples v0.0.0-20201112215255-90f1b3ee835b
)

replace github.com/dubbogo/grpc-go => ../../

replace github.com/dubbogo/grpc-go/examples => ../../examples
