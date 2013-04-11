require File.expand_path('../config/environment', __FILE__)

puts "Loading in " + ENV['RACK_ENV'] + " mode ..."
puts "Database in use: " + ENV['REDIS_URL']

run Nectune::API