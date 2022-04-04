# frozen_string_literal: true

class AdvisorFeedback < ApplicationRecord
  belongs_to :match

  validates :grade, presence: true
  validates :grade, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :match, uniqueness: true
end
