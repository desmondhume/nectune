require 'ohm'

class User < Ohm::Model
  attribute :username
  attribute :password
  index :username

  def validate
    assert_present :username
    assert_present :password
  end

end