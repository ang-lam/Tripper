class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    has_many :activities, dependent: :destroy

    accepts_nested_attributes_for :activities,
        allow_destroy: true, 
        reject_if: proc {|attr| attr['time'].blank? || attr['description'].blank?}

    validates :date, uniqueness:  { message: "an itinerary already exists for this date"}
    validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
        if date < Date.today && date.present?
            errors.add(:date, "cannot be in the past")
        end
    end
end
