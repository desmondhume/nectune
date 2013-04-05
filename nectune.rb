require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'redis'
require 'json'
require_relative 'models/ad.rb'

class Nectune < Sinatra::Base

	configure :development do
		Ohm.connect(:url=>'redis://127.0.0.1:6379/0')
	end

	configure :test do
		Ohm.connect(:url=>'redis://127.0.0.1:6379/1')
	end

	get '/' do
		'ok'
	end

	put '/ad' do
		Ad.create author: params[:author],
			title: params[:title],
			category: params[:category]
	end

end