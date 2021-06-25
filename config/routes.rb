Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # /api/users/:id/follow
  namespace :api do
    post :upload_image, to: 'utils#upload_image'
    resources :users, only: [] do
      member do
        post :follow
      end
    end

    # /api/stories/20/bookmark
    # /api/stories/20/clap
    resources :stories, only: [] do
      member do
        post :clap
        post :bookmark
      end
    end
  end

  resources :users, only: [] do
    collection do
      get :pricing      # /users/pricing
      get :payment      # /users/pricing
    end
  end
  
  resources :stories do
    resources :comments, only: [:create]
  end

  # /@howhow/文章標題
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  # /@howhow/
  get '@:username', to: 'pages#user', as: 'user_page'

  root 'pages#index'
  get '/demo', to: 'pages#demo'
end
