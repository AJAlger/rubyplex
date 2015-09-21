Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  resources :administrator
  resources :users
  resources :sketches, only: [:new, :create]

  delete ":username/:slug", to: "sketches#destroy", as: :sketch_delete
  get ":username/:slug/edit", to: "sketches#edit", as: :sketch_edit
  patch ":username/:slug", to: "sketches#update", as: :sketch_update
  get ":username/:slug", to: "sketches#show", as: :sketch_show
  get ":username", to: "sketches#index", as: :sketches_index

end
