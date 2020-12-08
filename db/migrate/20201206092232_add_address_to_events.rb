class AddAddressToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :address, :string
    add_column :events, :station2, :string
  end
end
