# frozen_string_literal: true

class AdvisorFeedbacksController < ApplicationController
  def index
    if current_advisor.present?
      feedbacks = AdvisorFeedback.all.includes(:match).where(matches: { advisor_id: current_advisor.id })

      if current_advisor.id == feedbacks.first&.match&.advisor&.id && feedbacks.present?
        render status: :ok, json: feedbacks.as_json
      elsif feedbacks.present? && (current_advisor&.id != feedbacks.first.match.advisor.id)
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
      feedback = AdvisorFeedback.find(params[:id])

      if (feedback.present? && feedback.match.advisor_id == current_advisor&.id) || feedback.match.user_id == current_user&.id
        render status: :ok, json: feedback.as_json
      elsif feedback.present? && (current_advisor&.id != feedback.match.advisor_id || feedback.match.user_id == current_user&.id)
        render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
      else
        render status: :no_content, json: { message: 'Objeto não encontrado' }
      end
    else
      render status: :unauthorized, json: { message: 'Há algo errado com sua autenticação.' }
    end
  end

  def create
    if current_user.present?
      feedback = AdvisorFeedback.new(feedback_params)

      if current_user.id == feedback.match.user.id && feedback.save
        render status: :created, json: feedback.as_json
      elsif current_user.id == feedback.match.user.id && AdvisorFeedback.find_by('match_id == ?',
                                                                                 feedback.match.id).present?
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
