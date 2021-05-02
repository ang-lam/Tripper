class User < ApplicationRecord
  has_secure_password

  has_many :itineraries
  has_many :destinations, through: :itineraries

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  validate :is_email?

  def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "not a valid email")
    end 
  end
end
