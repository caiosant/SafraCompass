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

  resources :user_profiles, only: [:show, :edit, :update]
end
