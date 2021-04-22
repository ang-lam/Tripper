class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.time :time
      t.string :description

      t.timestamps
    end
  end
end
