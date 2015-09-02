Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  resources :users
  resources :sketches



  #   index of sketches /aa/sketches
    # show a sketch /aa/sketches/324yhawedy7


end
