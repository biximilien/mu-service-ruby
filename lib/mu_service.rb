require 'roda'

class MuService < Roda
  route do |r|
    r.on "api" do
      r.on "v1" do
        # Protobuf gRPC over JSON demo
        # healthcheck for your convenience
        r.get "healthcheck" do
          response['Content-Type'] = 'application/json'
          resource = ::Resources::V1::Healthcheck
          msg = resource.new(status: 'ok')
          resource.encode_json(msg)
        end

        # example timestamp service
        r.get "clock" do
          response['Content-Type'] = 'application/json'
          resource = ::Resources::V1::Clock
          msg = resource.new(timestamp: Time.now.to_i)
          resource.encode_json(msg)
        end

        # example rpc endpoint
        r.is "search" do
          r.get do
            handler = SearchHandler.new(request, response)
            handler.to_json
          end

          r.post do
            handler = SearchHandler.new(request, response)
            handler.to_json
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
