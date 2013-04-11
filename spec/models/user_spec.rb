require File.expand_path('../../spec_helper.rb', __FILE__)

describe Nectune::API do
	include Rack::Test::Methods

	def app
		Nectune::API
	end

	before :each do
		Ohm.connect(url: 'redis://localhost:6379/1')
		Ohm.redis.flushdb
	end

	describe Nectune::API do
		describe User do

			it "Receive two parameters on post and create a User" do
				post '/api/user', {username: 'greg', password: 'password'}
				last_response.status.should == 201
			end

			it "Return 400 if username is not defined" do
				post '/api/user', {password: 'password'}
				last_response.status.should == 400
			end

			it "Return 400 if password is not defined" do
				post '/api/user', {username: 'greg'}
				last_response.status.should == 400
			end

			it "Return 400 if request contains not valid parameter" do
				post '/api/user', {username: 'greg', password: 'asdasdasd', asdo: 'asd'}
				last_response.status.should == 400
			end

		end
	end
end