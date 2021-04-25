class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy
end
