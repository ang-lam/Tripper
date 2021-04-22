class CreateItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :itineraries do |t|
      t.date :date
      t.integer :user_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
