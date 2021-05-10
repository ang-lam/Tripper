class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy

    accepts_nested_attributes_for :activities,
        allow_destroy: true,
        reject_if: proc {|act| act['time'].blank? && act['description'].blank?}



    validates :date, presence: true

    scope :trips_itineraries, -> (user, destination) {where(destination_id: destination, user_id: user.id)}
    scope :order_itineraries, -> {order(:date)}
end
