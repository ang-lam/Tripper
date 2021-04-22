class User < ApplicationRecord
  has_secure_password

  has_many :itineraries
  has_many :destinations, through: :itineraries

end
