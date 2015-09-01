Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  resources :users, only: [:index] do
    resources :sketches
  end

end
