Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts
  root "posts#index"
  get 'oauth2callback' => 'posts#set_google_drive_token'
  get 'home' => 'posts#home'
  get 'upload' => 'posts#upload'
end
