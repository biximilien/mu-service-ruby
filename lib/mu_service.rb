require 'roda'
require 'oj'
require 'logger'

class MuService < Roda

  # logging
  if ENV['RACK_ENV'] == "production"
    plugin :common_logger, ::Logger.new('log/production.log'),  method: :error
  elsif ENV['RACK_ENV'] == "test"
    plugin :common_logger, ::Logger.new('log/test.log'),        method: :debug
  else
    plugin :common_logger, ::Logger.new('log/development.log'), method: :debug
  end

  # error handling
  plugin :error_handler do |e|
    # logger.log(e)
    response['Content-Type'] = 'application/json'
    response.status = 500
    Oj.dump({"message" => "server error"})
  end

  # routing (Roda)
  route do |r|
    r.on "api" do
      r.on "v1" do
        # Protobuf gRPC over JSON demo
        # healthcheck for your convenience
        r.get "healthcheck" do
          handler = HealthcheckHandler.new(request, response)
          handler.handle
        end

        # example timestamp service
        r.get "clock" do
          handler = ClockHandler.new(request, response)
          handler.handle
        end

        # example crash
        r.get "crash" do
          raise "this will cause an intended crash!"
        end

        # example rpc endpoint
        r.is "search" do
          r.get do
            handler = SearchHandler.new(request, response)
            handler.handle
          end

          r.post do
            handler = SearchHandler.new(request, response)
            handler.handle
          end
        end

        # example CRUD REST API endpoint
        r.is "users" do
          # read
          r.get do

          end

          # update
          r.put do

          end

          # create
          r.post do

          end

          # destroy
          r.delete do

          end
        end
      end
    end
  end
end
