class AddDateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :date
  end
end
