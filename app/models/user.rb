class User < ActiveRecord::Base
  attr_accessible :login, :name, :password, :password_confirmation, :email
end
