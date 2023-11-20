Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :libraries do
    post 'update_report', on: :member
  end

  get 'user-libraries', to: 'libraries#user_libraries'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
