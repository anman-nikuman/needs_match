class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.references  :event,  foreign_key: true, null: false
      t.references  :staff
      t.integer     :status,  null: false, default: 0

      t.timestamps
    end
  end
end
