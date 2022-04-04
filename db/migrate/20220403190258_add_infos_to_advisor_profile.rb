# frozen_string_literal: true

class AddInfosToAdvisorProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :advisor_profiles, :cpf, :string
    add_column :advisor_profiles, :social_name, :string
    add_column :advisor_profiles, :state, :string
  end
end
