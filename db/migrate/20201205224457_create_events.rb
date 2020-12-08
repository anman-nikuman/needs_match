class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :branch, foreign_key: true, null: false
      t.datetime :date, null: false
      t.string :station
      t.string :postal_code
      t.integer :prefecture_code
      t.string :city
      t.string :street
      t.string :building

      t.timestamps
    end
  end
end
