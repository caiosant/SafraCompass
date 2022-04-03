Rails.application.routes.draw do

  devise_for :users,
    controllers: {
      registrations: :registrations,
      sessions: :sessions
    }

  resources :user_profiles, only: [:show, :edit, :update]
end
