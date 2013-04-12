module Nectune
	class API_v1 < Grape::API

		rescue_from :all
		format :json

		helpers do
			def validate_request!
				# skip validation if no parameter is declared
				return unless route.route_params
				route.route_params.each do |k, v|
					if !params.has_key? k
						error!("Missing field: #{k}", 400)
					end
				end
				params.each do |k, v|
					if !route.route_params.has_key? k and k != 'route_info'
						error!("Unknown field: #{k}", 400)
					end
				end
			end
		end

		before { validate_request! }

		resource :user do

			desc "Create a User"
			params do
				requires :username, :type => String, :desc => 'User username'
				requires :password, :type => String, :desc => 'User password'
			end
			post '/' do
				user = User.create(username: params[:username], password: params[:password])
			end

			desc "Get a User"
			desc "Update a User"
			desc "Remove a User"

		end

	end
	
end