Rails.application.routes.draw do

  devise_for :models

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "registrations"}

  resources :users do
    resources :items
  end

  root to: 'welcome#index'

end
