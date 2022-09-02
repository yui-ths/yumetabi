Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :posts do
    collection do
      get :random
      get :random2
      get :top
    end
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create]
  end

  root 'posts#top'
  resources :maps
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
