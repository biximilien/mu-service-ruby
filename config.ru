# Load microservice stack
$:.unshift File.expand_path('./resources/')
['resources', 'routes', 'handlers'].each do |dir|
  Dir.glob(File.join(['.', dir].join('/'), '**', '*.rb'), &method(:require))
end

# dependencies
require_relative "lib/mu_service"

run MuService.freeze.app
