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

  resources :user_profiles, only: [:show, :update]
  resources :advisor_profiles, only: [:show, :update]
  resources :matches, only: [:index, :show, :create, :update]
  resources :advisor_feedbacks, only: [:index, :create, :show]
end
