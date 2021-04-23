class AddItineraryIdToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :itinerary_id, :integer
  end
end
