# Load microservice stack
$:.unshift File.expand_path('./resources/')
['resources', 'services'].each do |dir|
  Dir.glob(File.join(['.', dir].join('/'), '**', '*.rb'), &method(:require))
end

# dependencies
require_relative "lib/mu_service"

# freeze to prevent unexpected modification except in development
unless ENV['RACK_ENV'] == "development"
  MuService.freeze
end

run MuService.app
