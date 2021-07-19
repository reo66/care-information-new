Rails.application.routes.draw do
  get 'sessions/new'
  root 'home#index'
  get '/signup', to: 'users#new'

  get '/top_overview', to: 'home#top_overview'
  

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get    '/users/search', to: 'users#search'

  post 'care_user/:care_user_id/user/:id', to: 'care_users#addition' , as: :addition
  
  
  resources :users do
    resources :intermediates, only: [:create, :destroy]
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
