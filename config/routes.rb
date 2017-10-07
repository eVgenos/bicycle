Rails.application.routes.draw do
  root 'bicycles#index'

  devise_for :users

  resources :bicycles do
    post :use, on: :member

    resources :suggestions
  end

  namespace :users do
    resources :bicycles
    resources :suggestions, except: %i[show update]
  end
end
