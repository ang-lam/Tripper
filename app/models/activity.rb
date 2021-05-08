class Activity < ApplicationRecord
    belongs_to :itinerary        
    
    validates :time, :description, presence: true

    scope :order_activities, -> (itinerary) {where(itinerary_id: itinerary.id).order(:time)}
end
