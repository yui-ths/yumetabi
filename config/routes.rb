Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :posts do
    collection do
      get :random
      get :top
    end
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create]
  end

  root 'posts#top'
  resources :maps

end