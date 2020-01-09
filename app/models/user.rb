class User < ApplicationRecord
  has_secure_password
  has_many :games, class_name: '::Game'
end
