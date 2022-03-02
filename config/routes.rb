Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#home'
  root to: 'pages#landing'
  get 'dashboard', to: 'pages#dashboard'
  get 'home', to: 'pages#home'
  get 'leaderboard/:id', to: 'challenges#leaderboard', as: 'leaderboard'
  get 'members/:id', to: 'challenges#members', as: 'members'
  get 'profile', to: 'pages#profile'
  get 'history', to: 'pages#history'
  get 'stats', to: 'pages#stats'
  resources :challenges do
    resources :user_challenges, only: [:index, :create, :show]
    resources :exercises, only: [:index, :edit, :update]
    resources :chatroom, only: [:create, :show]
  end
  resources :user_challenges, only: [:destroy]
  resources :exercises, only: [:destroy, :create, :new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
