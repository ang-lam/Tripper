class Activity < ApplicationRecord
    belongs_to :itinerary        
    
    validates :time, :description, presence: true
            
end
