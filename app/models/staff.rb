class Staff < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :affiliations, dependent: :destroy
  has_many :operations, dependent: :destroy
  has_many :affiliation_branches, through: :affiliations, source: :branch
  has_many :operation_events, through: :operations, source: :event
end
