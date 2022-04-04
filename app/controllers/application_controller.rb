# frozen_string_literal: true

class ApplicationController < ActionController::API
  ActiveRecord::Base.include_root_in_json = true
  respond_to :json
  before_action :user_process_token
  before_action :advisor_process_token

  def authenticate_user!(_options = {})
    head :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    @current_user_id.present?
  end

  def current_user
    if @current_user_id.nil?
      @current_user = @current_user_id
    else
      @current_user ||= super || User.find(@current_user_id)
    end
  end

  def user_process_token
    if request.headers['UserAuthorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['UserAuthorization'].split[0].remove('"'),
                                 Rails.application.secrets.secret_key_base).first
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  def authenticate_advisor!(_options = {})
    head :unauthorized unless advisor_signed_in?
  end

  def advisor_signed_in?
    @current_advisor_id.present?
  end

  def current_advisor
    if @current_advisor_id.nil?
      @current_advisor = @current_advisor_id
    else
      @current_advisor ||= super || Advisor.find(@current_advisor_id)
    end
  end

  def advisor_process_token
    if request.headers['AdvisorAuthorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['AdvisorAuthorization'].split[0].remove('"'),
                                 Rails.application.secrets.secret_key_base).first
        @current_advisor_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end
end
