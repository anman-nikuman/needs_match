class Operation < ApplicationRecord
  belongs_to :event
  belongs_to :staff
end
