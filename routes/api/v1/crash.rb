class MuService
  hash_routes "/api/v1" do |r|
    # example crash
    r.get "crash" do
      raise "this will cause an intended crash!"
    end
  end
end
