class Destination < ApplicationRecord
    has_many :itineraries, dependent: :destroy
    has_many :users, through: :itineraries

    accepts_nested_attributes_for :itineraries
end
