class UserProfilesController < ApplicationController
    before_action :authenticate_user!

    def show

        profile = UserProfile.find(params[:id])

        if current_user == profile.user
            render status: :ok, json: current_user.as_json(include: :user_profile)
        else
            head :unauthorized
        end
    end

    def update
        profile = UserProfile.find(params[:id])
        
        if current_user == profile.user && profile.update(user_profile_params)
            render status: :ok, json: current_user.as_json(include: :user_profile)
        elsif current_user != profile.user
            head :unauthorized
        else
            render status: :bad_request            
        end
    end

    private

    def user_profile_params
      params.require(:user_profile).permit(:name, :last_name, :social_name, :birthday, :gender, :adress,
                                           :adress_number, :adress_complement, :country, :state, :city,
                                           :born_in, :cpf, :rg, :rg_issuer, :deficient, :deficient_description,
                                           :mom_name, :marital_status)
    end
end
