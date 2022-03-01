Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  root to: 'pages#landing'
  get 'dashboard', to: 'pages#dashboard'
  get 'home', to: 'pages#home'
  resources :challenges do
    resources :user_challenges, only: [:index, :create, :show]
    resources :exercise, only: [:index, :create, :new, :edit, :update]
    resources :chatroom, only: [:create, :show]
  end
  resources :user_challenges, only: [:destroy]
  resources :exercise, only: [:destroy]

  get 'leaderboard', to: 'pages#leaderboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
