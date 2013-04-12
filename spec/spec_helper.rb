require 'rubygems'
require 'rack/test'
ENV["RACK_ENV"] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require File.expand_path("../../models/user.rb", __FILE__)

RSpec.configure do |config|
	config.mock_with :rspec
	config.expect_with :rspec
end