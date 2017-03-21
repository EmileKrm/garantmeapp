class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :organisation
  has_attachment :id_card
end
