Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :libraries do
    member do
      get 'run_scan', to: 'libraries#run_scan'
    end
    resources :items, only: [:show]
  end

  get 'user-libraries', to: 'libraries#user_libraries'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
