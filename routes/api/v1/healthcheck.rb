class MuService
  hash_routes "/api/v1" do |r|
    # Protobuf gRPC over JSON demo
    # healthcheck for your convenience
    r.get "healthcheck" do
      service = HealthcheckService.new(request, response)
      service.call
    end
  end
end
