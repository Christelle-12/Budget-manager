Rails.application.routes.draw do
  # get 'home/index'
  # resources :categories
  # resources :records
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: 'home#index'
  root "home#index"
  resources :categories, only: [:index, :new, :create, :destroy] do
    resources :records, only: [:index, :new, :create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
