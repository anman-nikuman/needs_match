class Affiliation < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliations do |t|
      t.references :branch, foreign_key: true, null: false
      t.references :staff,  foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
