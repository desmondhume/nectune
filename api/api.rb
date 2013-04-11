module Nectune
	class Nectune::API < Grape::API
		prefix 'api'
		format :json
		mount Nectune::API_v1
	end
end