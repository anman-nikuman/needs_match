class Branch < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if find_by(name: row["支部名"])
        next
      end

      branch = new
      
      delete_list = ["開催週", "c-we", "時間", "c-pr", "主催", "c-sh", "幹事", "c-ka", "事務局長", "c-ji", "最寄駅1", "最寄駅2", "会場住所"]
      branch_key = [["都道府県", "area"], ["支部名", "name"], ["星", "evaluation"]]
      branch_hash = row.to_h

      branch_hash.delete_if {|k, v|
        delete_list.include?(k)
      }

      branch_hash_db = branch_key.map {|x| [ x[1], branch_hash[x[0]] ] }.to_h

      if branch_hash_db["evaluation"].nil?
        branch_hash_db["evaluation"] = 0
      else
        branch_hash_db["evaluation"] = branch_hash_db["evaluation"].size
      end

      branch.attributes = branch_hash_db.slice(*updatable_branch_attributes)
      branch.save
    end
  end

  def self.updatable_branch_attributes
    ["name", "area", "evaluation"]
  end
end
