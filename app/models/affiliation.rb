class Affiliation < ApplicationRecord
  belongs_to :branch
  belongs_to :staff
end
