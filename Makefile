# Makefile for Protobuf/gRPC generation (Windows compatible)

# Directories
PROTO_DIR := proto
GEN_DIR := gen\go
PROTO_FILE := $(PROTO_DIR)\sso\sso.proto

# Protoc compiler settings
PROTOC := protoc
PROTOC_OPTS := -I $(PROTO_DIR)
GO_OUT := --go_out=$(GEN_DIR) --go_opt=paths=source_relative
GO_GRPC_OUT := --go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative

.PHONY: all clean generate

all: generate

generate:
	@echo Generating Protobuf and gRPC files...
	@if not exist "$(GEN_DIR)" mkdir "$(GEN_DIR)"
	$(PROTOC) $(PROTOC_OPTS) $(PROTO_FILE) $(GO_OUT) $(GO_GRPC_OUT)
	@echo Generation complete!

clean:
	@echo Cleaning generated files...
	@if exist "$(GEN_DIR)" rmdir /s /q "$(GEN_DIR)"
	@echo Clean complete!