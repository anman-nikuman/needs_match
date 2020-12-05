class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.string :area, null: false
      t.integer :evaluation, null: false

      t.timestamps
    end
  end
end
