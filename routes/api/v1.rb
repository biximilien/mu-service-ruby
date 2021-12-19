class MuService
  hash_routes "/api" do
    on "v1" do |r|
      r.hash_routes "/api/v1"
    end
  end
end
