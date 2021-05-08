class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy

    accepts_nested_attributes_for :activities,
        allow_destroy: true, 
        reject_if: proc {|attr| attr['time'].blank? && attr['description'].blank?}

    validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
        if !date.present? || date < Date.today
            errors.add(:date, "cannot be in the past or empty")
        end
    end

    scope :trips_itineraries, -> (user, destination) {where(destination_id: destination, user_id: user.id)}
    scope :order_itineraries, -> {order(:date)}

end
