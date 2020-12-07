class RenameStationColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :station, :station1
  end
end
