Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :photos
  end
  # get 'home/index'
  # root 'home#index'

  get '/photos', to: 'photos#show_all'
  # root 'photos#index'
end
