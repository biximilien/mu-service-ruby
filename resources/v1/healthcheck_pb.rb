# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: v1/healthcheck.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("v1/healthcheck.proto", :syntax => :proto3) do
    add_message "resources.v1.Healthcheck" do
      optional :status, :string, 1
    end
  end
end

module Resources
  module V1
    Healthcheck = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("resources.v1.Healthcheck").msgclass
  end
end
