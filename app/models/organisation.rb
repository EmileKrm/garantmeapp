class Organisation < ApplicationRecord
  has_many :users
  has_many :interviews
  validates :name, presence: true
end
