class MuService
  hash_routes("/api/v1").on "search" do |r|
    # example rpc endpoint
    r.get do
      handler = SearchHandler.new(request, response)
      handler.handle
    end

    r.post do
      handler = SearchHandler.new(request, response)
      handler.handle
    end
  end
end
