require 'logger'
require 'roda'
require 'oj'

if ENV['RACK_ENV'] == "production"
  require_relative './environment/production'
elsif ENV['RACK_ENV'] == "test"
  require_relative './environment/test'
else
  require_relative './environment/development'
end

LOGGER.level = LOG_LEVEL
