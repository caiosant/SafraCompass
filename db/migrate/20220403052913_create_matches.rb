# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :advisor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :active, null: false, default: true
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
