class CreateIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :introductions do |t|
      t.references :source, null: false, foreign_key: {to_table: :customers}
      t.references :destination, null: false, foreign_key: {to_table: :customers}
      t.timestamps
    end
  end
end
