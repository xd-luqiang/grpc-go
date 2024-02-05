module github.com/xd-luqiang/grpc-go/security/advancedtls/examples

go 1.15

require (
	github.com/xd-luqiang/grpc-go v1.38.0
	github.com/xd-luqiang/grpc-go/examples v0.0.0-20201112215255-90f1b3ee835b
	github.com/xd-luqiang/grpc-go/security/advancedtls v0.0.0-20201112215255-90f1b3ee835b
)

replace github.com/xd-luqiang/grpc-go => ../../..

replace github.com/xd-luqiang/grpc-go/examples => ../../../examples

replace github.com/xd-luqiang/grpc-go/security/advancedtls => ../
