class Destination < ApplicationRecord
    has_many :itineraries, dependent: :destroy
    has_many :users, through: :itineraries

    accepts_nested_attributes_for :itineraries

    validates :city, :country, presence: true

    scope :popular_trips, -> {joins(:itineraries).group('id').order('count(destinations.id) desc').limit(2)}

end
