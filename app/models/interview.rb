class Interview < ApplicationRecord
  belongs_to :user
  belongs_to :organisation, optional: true
  has_many :appartments

  has_attachment :id_card
  has_attachment :proof_of_revenue
  has_attachment :school_certificate
  has_attachment :combined_pdf

  def name
    id
  end
end
