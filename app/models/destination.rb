class Destination < ApplicationRecord
    has_many :itineraries, dependent: :destroy
    has_many :users, through: :itineraries

    accepts_nested_attributes_for :itineraries

    validates :city, :country, presence: true
    validate :destination_entered_is_unique
    #add custom validation method to make sure city and state are both uniq so that no duplicate

    def destination_entered_is_unique
        if Destination.find_by(city: city, state: state)
            errors.add(:city, "already exists. Please select from drop down menu.")
        end
    end

    def collection_select_destination_name
        "#{city.split.map(&:capitalize).join(' ')}, #{state.split.map(&:capitalize).join(' ') if state}, #{country.split.map(&:capitalize).join(' ')}"
    end

    scope :popular_trips, -> {joins(:itineraries).group('id').order('count(destinations.id) desc').limit(2)}
    # scope :users_trips, -> (user) {joins(:itineraries).where(id = "destination_id").order(:date).uniq}
end
