class MuService
  hash_routes("/api/v1").on "search" do |r|
    # example rpc endpoint
    r.get do
      service = SearchService.new(request, response)
      service.call
    end

    r.post do
      service = SearchService.new(request, response)
      service.call
    end
  end
end
