require 'roda'
require 'oj'
require 'logger'

class MuService < Roda

  # logging
  if ENV['RACK_ENV'] == "production"
    LOGGER = ::Logger.new('log/production.log').freeze
    LOG_LEVEL = :error.freeze
  elsif ENV['RACK_ENV'] == "test"
    LOGGER = ::Logger.new('log/test.log').freeze
    LOG_LEVEL = :debug.freeze
  else
    LOGGER = ::Logger.new('log/development.log').freeze
    LOG_LEVEL = :debug.freeze
  end
  plugin :common_logger, LOGGER, method: LOG_LEVEL

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
