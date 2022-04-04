# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :last_name
      t.string :social_name
      t.date :birthday
      t.integer :gender
      t.string :adress
      t.string :adress_number
      t.string :adress_complement
      t.string :country
      t.string :state
      t.string :city
      t.string :born_in
      t.string :cpf
      t.string :rg
      t.string :rg_issuer
      t.boolean :deficient
      t.integer :deficient_description
      t.string :mom_name
      t.integer :marital_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
