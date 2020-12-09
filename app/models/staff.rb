class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      staff = find_by(id: row["NM-ID"], family_name: row["姓"], given_name: row["名"], email: row["メール"], encrypted_password: row["pass"]) || new
      # staff.attributes = row.to_hash_slice(*updatable_attributes)
      staff.save!
    end
  end
  
  def self.updatable_attributes
    ["id", "family_name", "given_name", "email", "password"]
  end

end
