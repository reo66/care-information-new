Rails.application.routes.draw do

  root 'home#index'

  get '/top_overview', to: 'home#top_overview'

  # サインアップ
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'care_user/:care_user_id/user/:id', to: 'care_users#addition' , as: :addition
  
  get '/care_users/search', to: 'care_users#search'
  get '/care_users/click', to: 'care_users#click'
  get '/care_users/click_a', to: 'care_users#click_a'
  get '/care_users/click_b', to: 'care_users#click_b'
  get '/care_users/click_search', to: 'care_users#click_search'
  get '/care_users/click_search_a', to: 'care_users#click_search_a'
  get '/care_users/click_search_b', to: 'care_users#click_search_b'




  resources :users, except: :new do
    collection do
      get :search
    end
  end

  resources :care_users do
    resources :intermediates, only: [:update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
