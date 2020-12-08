class AddPrefectureCodeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :prefecture_code, :string
  end
end
