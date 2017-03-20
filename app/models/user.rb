class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :interviews
  belongs_to :organisation
  devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: [:linkedin],
         :recoverable, :rememberable, :trackable, :validatable

end
