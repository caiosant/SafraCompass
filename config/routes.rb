# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :advisors,
             controllers: {
               registrations: :advisor_registrations,
               sessions: :advisor_sessions
             }

  devise_for :users,
             controllers: {
               registrations: :user_registrations,
               sessions: :user_sessions
             }

  resources :user_profiles, only: %i[show update]
  resources :advisor_profiles, only: %i[show update]
  resources :matches, only: %i[index show create update]
  resources :advisor_feedbacks, only: %i[index create show]
end
