class RemoveBuildingFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :building, :string
  end
end
