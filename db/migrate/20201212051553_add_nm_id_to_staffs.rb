class AddNmIdToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :nm_id, :integer, null: false
  end
end
