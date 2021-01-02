class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :introductions, dependent: :destroy

  def self.import_customer(file)
    CSV.foreach(file.path, headers: true) do |row|
      customer = find_by(nm_id: row["NO"]) || new
      customer_key = [["NO", "nm_id"],["姓", "family_name"],["名", "given_name"],["フリガナ", "name_kana"], ["会社名（屋号）", "company_name"], ["業種", "industry"], ["メールアドレス", "email"], ["Pass", "password"]]
      customer_hash = row.to_h
      customer_hash_db = customer_key.map {|x| [ x[1], customer_hash[x[0]] ]}.to_h
      
      customer.attributes = customer_hash_db.to_h.slice(*updatable_customer_attributes)
      
      customer.save!
    end
  end

  def self.updatable_customer_attributes
    [
     "nm_id", 
     "family_name",
     "given_name",
     "name_kana",
     "company_name",
     "department",
     "position",
     "industry",
     "company_postal_code",
     "conpany_address",
     "expiration_date",
     "email",
     "password"
    ]
  end
  
end
