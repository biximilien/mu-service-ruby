class MuService
  hash_routes "" do
    on "api" do |r|
      r.hash_routes "/api"
    end
  end
end
