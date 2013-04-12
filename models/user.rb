# require 'ohm'

# class User < Ohm::Model
#   attribute :username
#   attribute :password
#   index :username

#   def validate
#     assert_present :username
#     assert_present :password
#   end

# end

class User
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :username,   String    # A varchar type string, for short strings
  property :password,   String    # A varchar type string, for short strings
  property :email,   String       # A varchar type string, for short strings
  property :created_at, DateTime  # A DateTime, for any date you might like.

end