Rails.application.routes.draw do
  get 'rooms/index'
  resources :friends
  resources :comments
  resources :posts
  resources :rooms do
    resources :messages
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "users#show"

  get '/search' => 'users#search'
  post '/add_friend/:friend_id/:user_id' => 'friends#create', as: 'add_friend'
  get '/:id' => 'users#show', as: 'profile'
  post '/comments/:post_id' => 'comments#create', as: 'add_comment'
end
