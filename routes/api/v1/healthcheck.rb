class MuService
  hash_routes "/api/v1" do |r|
    # Protobuf gRPC over JSON demo
    # healthcheck for your convenience
    r.get "healthcheck" do
      handler = HealthcheckHandler.new(request, response)
      handler.handle
    end
  end
end
