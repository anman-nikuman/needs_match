class RemoveCityFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :city, :string
  end
end
