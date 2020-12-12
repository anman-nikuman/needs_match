class Staff < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :affiliations, dependent: :destroy
  has_many :operations, dependent: :destroy
  has_many :affiliation_branches, through: :affiliations, source: :branch
  has_many :operation_events, through: :operations, source: :event

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
