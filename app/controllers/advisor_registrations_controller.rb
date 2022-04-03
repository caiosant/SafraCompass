class AdvisorRegistrationsController < Devise::RegistrationsController
    def create
        advisor = Advisor.new(sign_up_params)
      
        if advisor.save
        token = advisor.generate_jwt
          render json: token.to_json
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
    end
end