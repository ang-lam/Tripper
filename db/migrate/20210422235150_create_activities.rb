class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.time :time, limit: 0
      t.string :description

      t.timestamps
    end
  end
end
