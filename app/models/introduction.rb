class Introduction < ApplicationRecord
  belongs_to :customer

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if find_by(source: row["紹介者コード"])
        next
      end

      introduction_key = [["NO", "nm_id"],["姓", "family_name"],["名", "given_name"],["フリガナ", "name_kana"], ["会社名（屋号）", "company_name"], ["業種", "industry"], ["メールアドレス", "email"], ["Pass", "password"]]
      introduction_hash = row.to_h
      introduction_hash_db = introduction_key.map {|x| [ x[1], introduction_hash[x[0]] ]}.to_h
      
      # customer_hash_db["branch_id"] = Branch.find_by(name: row.to_h["支部"]).id
      # customer_hash_db["operation_id"] = Operation.find_by(staff_id: row.to_h["属性"]).id
      introduction.attributes = introduction_hash_db.to_h.slice(*updatable_introfuction_attributes)
      
      introduction.save!
    end
  end

  def self.updatable_introduction_attributes
    ["source", "destination", "given_name"]
  end

end
