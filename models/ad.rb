require 'ohm'
require 'pp'

class Ad < Ohm::Model
	attribute :author
	attribute :title
	attribute :category
	index :category
end