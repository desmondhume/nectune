require 'json'
require File.expand_path('../environments/' + ENV['RACK_ENV'], __FILE__)
require File.expand_path('../application', __FILE__)