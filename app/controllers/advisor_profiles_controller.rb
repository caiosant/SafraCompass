class AdvisorProfilesController < ApplicationController
    def show
        profile = AdvisorProfile.find(params[:id])

        if current_advisor == profile.advisor
            render status: :ok, json: current_advisor.as_json(include: :advisor_profile)
        else
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        end
    end

    def update
        profile = AdvisorProfile.find(params[:id])
        
        if current_advisor == profile.advisor && profile.update(advisor_profile_params)
            render status: :ok, json: current_advisor.as_json(include: :advisor_profile)
        elsif current_advisor != profile.advisor
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        else
            render status: :bad_request            
        end
    end

    private

    def advisor_profile_params
      params.require(:advisor_profile).permit(:name, :last_name, :social_name, :birthday, :gender, :adress,
                                           :adress_number, :adress_complement, :country, :state, :city,
                                           :born_in, :cpf, :ancord_code, :rg, :rg_issuer, :deficient, :deficient_description,
                                           :mom_name, :marital_status)
    end
end
