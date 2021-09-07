begin
  # load RSpec and setup test task
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
  task :test => :spec
rescue LoadError
end


# requires grpc_tools_ruby_protoc
desc "compiles the protocol buffers"
task "build" do
  sh "grpc_tools_ruby_protoc", "--proto_path=protos", "--ruby_out=resources", "--grpc_out=resources", *Dir.glob("protos/**/*.proto")
end
