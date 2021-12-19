class MuService
  hash_routes "/api/v1" do |r|
    # Protobuf gRPC over JSON demo
    # healthcheck for your convenience
    r.get "clock" do
      handler = ClockService.new(request, response)
      handler.call
    end
  end
end
