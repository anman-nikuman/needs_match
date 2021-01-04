class Introduction < ApplicationRecord
  belongs_to :destination, class_name: 'Customer'
  belongs_to :source, class_name: 'Customer'

  def self.import_customer(file)
    CSV.foreach(file.path, headers: true) do |row|
      # if find_by(source_id: row["紹介者コード"])
      #   next
      # end

      introduction = new
      
      source_code = row.to_h["紹介者コード"]
      source_id = Customer.find_by(nm_id: source_code).id
     
      destination_code = row.to_h["NO"]
      destination_id = Customer.find_by(nm_id: destination_code).id
      
      introduction_hash_db = { "source_id" => source_id, "destination_id" => destination_id }

      introduction.attributes = introduction_hash_db.to_h.slice(*updatable_introduction_attributes)
      introduction.save
    end
  end

  def self.updatable_introduction_attributes
    ["source_id", "destination_id"]
  end
end

# find_by・・・カラムを基にして１つレコードを取得
# find・・・idを基にして探して該当したものを1つ取得
# where・・・カラムを基にして該当したもの全部取得
