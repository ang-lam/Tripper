class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy

    accepts_nested_attributes_for :activities
end
