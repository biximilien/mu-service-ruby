desc "compiles the protocol buffers"
task "build" do
  sh "grpc_tools_ruby_protoc", "--proto_path=protos", "--ruby_out=resources", "--grpc_out=resources", *Dir.glob("protos/**/*.proto")
end
