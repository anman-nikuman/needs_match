class AddNameToBranch < ActiveRecord::Migration[5.2]
  def change
    add_index :branches, :name, :unique => true
    add_index :branches, :evaluation
  end
end
