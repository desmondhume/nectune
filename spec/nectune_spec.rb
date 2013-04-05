require 'rack/test'
require 'rspec'
require 'mock_redis'
# Require all models
require_relative '../models/ad'

Rack::Builder.parse_file(File.expand_path('config.ru'))

ENV['RACK_ENV'] = 'test'

describe 'Nectune' do
	include Rack::Test::Methods

	def app 
		Nectune.new
	end

	before :each do
		Ohm.redis.flushdb
	end

	it 'should load root url' do
		get '/'
		last_response.should be_ok
		last_response.body.should == 'ok'
	end

	# Models Tests

	describe 'Ad' do

		it 'should accept three parameters on put and create instance of Ad' do
			put '/ad', {title: 'Title', author: 'Author', category: 'Category'}
			last_response.should be_ok
			ad = Ad[1]
			ad.id.should == 1
			ad.title.should == 'Title'
			ad.author.should == 'Author'
			ad.category.should == 'Category'
		end

	end

end
