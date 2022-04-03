class Advisor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_one :advisor_profile
  has_many :matches
  has_many :advisor_feedbacks, through: :matches

  after_create :create_advisor_profile

  def create_advisor_profile
    AdvisorProfile.create(advisor: self)
  end

  def generate_jwt
    JWT.encode({id: id, exp: 10.minutes.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end
end
