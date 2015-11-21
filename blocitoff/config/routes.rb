Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "registrations"}
  resources :users, only: [:show]


  get 'welcome/index'
  root 'welcome#index'



end
