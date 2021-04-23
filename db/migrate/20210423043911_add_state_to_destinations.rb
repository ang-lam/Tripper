class AddStateToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :state, :string
  end
end
