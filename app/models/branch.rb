class Branch < ApplicationRecord
  has_many :events, dependent: :destroy
end
