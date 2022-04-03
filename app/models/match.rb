class Match < ApplicationRecord
  belongs_to :advisor
  belongs_to :user
  has_one :advisor_feedback

  validates :started_at, presence: true
end
