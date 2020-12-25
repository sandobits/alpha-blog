Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: 'pages#about'
  
  resources :articles, only: [:show] # selects only the #show action for a single article
  # resources :articles
end
