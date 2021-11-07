module github.com/dubbogo/grpc-go/security/advancedtls/examples

go 1.15

require (
	github.com/dubbogo/grpc-go v1.38.0
	github.com/dubbogo/grpc-go/examples v0.0.0-20201112215255-90f1b3ee835b
	github.com/dubbogo/grpc-go/security/advancedtls v0.0.0-20201112215255-90f1b3ee835b
)

replace github.com/dubbogo/grpc-go => ../../..

replace github.com/dubbogo/grpc-go/examples => ../../../examples

replace github.com/dubbogo/grpc-go/security/advancedtls => ../
