class Appartment < ApplicationRecord
   has_many :interviews
   validates :appartment_address, presence: true
end
