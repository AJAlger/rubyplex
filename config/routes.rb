Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  resources :users
  resources :sketches, only: [:new, :create]

  #get ":username/:slug/edit", to: "sketches#edit"
  get ":username/:slug", to: "sketches#show", as: :sketch_show
  get ":username", to: "sketches#index", as: :sketches_index

  #   index of sketches /aa/
    # show a sketch /aa/324yhawedy7

# sketches_index_path @
end
