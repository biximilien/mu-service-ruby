class MuService < Roda

  # logging
  plugin :common_logger, LOGGER

  # error handling
  plugin :error_handler do |e|
    LOGGER.error(e.message)
    response['Content-Type'] = 'application/json'
    response.status = 500
    Oj.dump({"message" => "server error"})
  end

  plugin :not_found do
    response['Content-Type'] = 'application/json'
    response.status = 404
    Oj.dump({"message" => "not found"})
  end

  # routing (Roda)
  plugin :hash_routes

  Dir.glob('./routes/**/*.rb').each do |route|
    require File.expand_path(route)
  end

  route do |r|
    r.hash_routes
  end
end
