Rails.application.routes.draw do

  devise_for :models
  get 'items/create'

  devise_for :users, controllers: {sessions: "users/sessions", registrations: "registrations"}
  resources :users do
    resources :items
  end

  get 'welcome/index'
  root 'welcome#index'

end
