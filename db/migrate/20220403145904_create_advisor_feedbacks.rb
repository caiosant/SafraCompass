# frozen_string_literal: true

class CreateAdvisorFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :advisor_feedbacks do |t|
      t.integer :grade
      t.text :comment
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
