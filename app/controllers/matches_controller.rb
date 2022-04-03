class MatchesController < ApplicationController

    def index
        
        if current_advisor.present?
            matches = Match.all.where('advisor_id == ?', current_advisor.id)

            if matches.present? && matches.first.advisor_id == current_advisor&.id
                render status: :ok, json: matches.as_json
            elsif matches.present? and current_advisor&.id != matches.first.advisor_id
                render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
            else
                render status: :no_content, json: { message: 'Objeto não encontrado' }
            end
        else
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        end
    end

    def show
        if current_advisor.present? || current_user.present?
            match = Match.find(params[:id])
            
            if match.present? && match.advisor_id == current_advisor&.id || match.user_id == current_user&.id 
                render status: :ok, json: match.as_json
            elsif match.present? and current_advisor&.id != match.advisor_id || match.user_id == current_user&.id 
                render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
            else
                render status: :no_content, json: { message: 'Objeto não encontrado' }
            end
        else
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        end
    end

    def create
        match = Match.new(match_params)
        match.started_at = DateTime.now
        match.active = true

        if current_user.id == match.user.id && match.save
            render status: :created, json: match.as_json
        elsif current_user.id != match.user.id
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        else
            render status: :bad_request
        end
    end

    def update
        match = Match.find(params[:id])
        
        if match.update(active: match_params[:active]) && current_user.id == match.user.id && match_params[:active] == false
            render status: :ok, json: match.as_json
        elsif current_user.id != match.user.id
            render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
        else
            render status: :bad_request
        end
    end

    private

    def match_params
        params.require(:match).permit(:advisor_id, :user_id, :active)
    end
end