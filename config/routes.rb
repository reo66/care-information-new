Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#index'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get    '/users/search', to: 'users#search'

  
  resources :users do
    member do
      get 'care_users/edit_index'
      patch 'care_users/update_index'
    end
  end
  resources :care_users do
    collection do
      get 'search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
