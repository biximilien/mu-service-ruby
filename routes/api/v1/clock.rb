class MuService
  hash_routes "/api/v1" do |r|
    # Protobuf gRPC over JSON demo
    # healthcheck for your convenience
    r.get "clock" do
      handler = ClockHandler.new(request, response)
      handler.handle
    end
  end
end
