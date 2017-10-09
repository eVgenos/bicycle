Rails.application.routes.draw do
  root 'bicycles#index'

  devise_for :users

  resources :bicycles, only: %i[index show] do
    post :use, on: :member

    resources :suggestions, only: %i[new create]
  end

  namespace :users do
    resources :bicycles, except: :show do
      resources :suggestions, only: %i[index edit update destroy]
    end
  end
end
