class AdvisorFeedbacksController < ApplicationController
    def create
        if current_user.present?
            feedback = AdvisorFeedback.new(feedback_params)

            if current_user.id == feedback.match.user.id && feedback.save
                render status: :created, json: feedback.as_json
            elsif current_user.id == feedback.match.user.id && AdvisorFeedback.find_by('match_id == ?', feedback.match.id).present?
                render status: :bad_request, json: { message: 'Já existe feedback para este match' }
            elsif current_user.id != feedback.match.user.id
                render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
            end
        end
    end

    private

    def feedback_params
        params.require(:advisor_feedback).permit(:grade, :coment, :match_id)
    end
end