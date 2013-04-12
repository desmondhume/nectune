$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require(:default, ENV['RACK_ENV'])

DataMapper.setup(:default, ENV["DATAMAPPER_URL"])

require File.expand_path('../../models/user.rb', __FILE__)

DataMapper.finalize
DataMapper.auto_migrate! 

Dir[File.expand_path('../../api/api_v*.rb', __FILE__)].each do |f|
	require f
end

require File.expand_path('../../api/api.rb', __FILE__)