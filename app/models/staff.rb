class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      staff = find_by(nm_id: row["NM-ID"]) || new
      staff_key = [["NM-ID", "nm_id"], ["姓", "family_name"], ["名", "given_name"], ["メール", "email"], ["pass", "password"]]
      staff_hash = row.to_h
      staff_hash_db = staff_key.map {|x| [ x[1], staff_hash[x[0]] ]}.to_h
      staff.attributes = staff_hash_db.to_h.slice(*updatable_staff_attributes)
      staff.save!
    end
  end
  
  def self.updatable_staff_attributes
    ["nm_id", "family_name", "given_name", "email", "password"]
  end

end
