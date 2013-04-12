require File.expand_path('../../spec_helper.rb', __FILE__)

describe Nectune::API do

	include Rack::Test::Methods

	def app
		Nectune::API
	end

	describe User do

		it "Receive three parameters on post and create a User" do
			post '/api/user', {username: 'username', password: 'password', email: 'nectune@user.com'}
			last_response.status.should == 201
		end

		it "Return 400 if username parameter is missing" do
			post '/api/user', {password: 'password', email: 'nectune@user.com'}
			last_response.status.should == 400
		end

		it "Return 400 if password parameter is missing" do
			post '/api/user', {username: 'greg', email: 'nectune@user.com'}
			last_response.status.should == 400
		end

		it "Return 400 if email parameter is missing" do
			post '/api/user', {username: 'greg', password: 'password'}
			last_response.status.should == 400
		end

		it "Return 400 if request contains unknown parameter" do
			post '/api/user', {username: 'greg', password: 'asdasdasd', email: 'nectune@user.com', foo: 'bar'}
			last_response.status.should == 400
		end

		it "Return 400 if username value is empty" do
			post '/api/user', {username: '', password: 'asdasdasd', email: 'nectune@user.com'}
			last_response.status.should == 400
		end

		it "Return 400 if password value is empty" do
			post '/api/user', {username: 'greg', password: '', email: 'nectune@user.com'}
			last_response.status.should == 400
		end

		it "Return 400 if email value is empty" do
			post '/api/user', {username: 'greg', password: 'asdasdasd', email: ''}
			last_response.status.should == 400
		end

	end

end