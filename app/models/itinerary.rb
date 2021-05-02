class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy

    accepts_nested_attributes_for :activities,
        allow_destroy: true, 
        reject_if: proc {|attr| attr['time'].blank? && attr['description'].blank?}

    # validates :date, uniqueness:  { message: "has an exisiting itinerary"}
    validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
        if !date.present? || date < Date.today
            errors.add(:date, "cannot be in the past or empty")
        end
    end
end
