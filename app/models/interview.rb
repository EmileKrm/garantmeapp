class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :organisation, optional: true

  has_attachment :id_card
  has_attachment :proof_of_revenue
  has_attachment :school_certificate

  def name
    id
  end
end
