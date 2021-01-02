class Introduction < ApplicationRecord
  belongs_to :customer

  def self.import_customer(file)
    CSV.foreach(file.path, headers: true) do |row|
      introduction = find_by(source_id: row["紹介者コード"])

      introduction_key = [["紹介者コード", "source_id"],["NO", "destination_id"]]
      introduction_hash = row.to_h
      introduction_hash_db = introduction_key.map {|x| [ x[1], introduction_hash[x[0]] ]}.to_h
      
      introduction.attributes = introduction_hash_db.to_h.slice(*updatable_introduction_attributes)
      
      introduction.save!
    end
  end

  def self.updatable_introduction_attributes
    ["source_id", "destination_id"]
  end
end
