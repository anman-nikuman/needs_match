class RemoveStreetFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :street, :string
  end
end
