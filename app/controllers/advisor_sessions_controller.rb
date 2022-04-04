# frozen_string_literal: true

class AdvisorSessionsController < Devise::SessionsController
  def create
    advisor = Advisor.find_by(email: sign_in_params[:email])

    if advisor&.valid_password?(sign_in_params[:password])
      token = advisor.generate_jwt
      render json: token.to_json
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
