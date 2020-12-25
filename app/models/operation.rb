class Operation < ApplicationRecord
  belongs_to :event
  belongs_to :staff

  enum status: { 予約済・募集中: 0, 主催者: 1, 幹事: 2, 事務局長:3 }

end
