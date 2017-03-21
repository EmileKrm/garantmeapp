class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :organisation, optional: true
  has_attachment :id_card

end
