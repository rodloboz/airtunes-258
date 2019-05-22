Rails.application.routes.draw do
  root to: 'artists#index'

  resources :artists, only: :show do
    resources :albums, only: [:new, :create]
  end
  resources :albums, only: :destroy
end
