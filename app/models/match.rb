class Match < ApplicationRecord
  belongs_to :advisor
  belongs_to :user

  validates: :started_at, :active, presence: true
end
