Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :stories

  # /@howhow/文章標題
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  # /@howhow/
  get '@:username', to: 'pages#user', as: 'user_page'

  root 'pages#index'
  get '/demo', to: 'pages#demo'
end
