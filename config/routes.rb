Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: 'profiles#user_show'
  get 'profile/:id', to: 'profiles#show'

  resources :libraries do
    member do
      get 'run_scan', to: 'libraries#run_scan'
      post 'bookmark', to: 'bookmarks#create'
      delete 'bookmark', to: 'bookmarks#destroy'
    end
    resources :items, only: [:show]
  end

  get 'bookmarks', to: 'bookmarks#index'

  get 'user-libraries', to: 'libraries#user_libraries'

  get 'like/:id', to: 'likes#create', as: 'like'

  delete 'like/:id', to: 'likes#destroy'

  get 'remove-all-likes', to: 'likes#destroy_all'

  get 'likes', to: 'likes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
