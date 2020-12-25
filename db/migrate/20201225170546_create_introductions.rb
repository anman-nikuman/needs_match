class CreateIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :introductions do |t|
      t.references  :customer,  foreign_key: true, null: false
      t.integer :source, null: false
      t.integer :destination, null:false
      t.timestamps
    end
  end
end
