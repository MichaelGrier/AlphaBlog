Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  # resources :articles, only: %i[show index new create edit update] # allow only these routes
end
