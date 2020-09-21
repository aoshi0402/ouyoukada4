Rails.application.routes.draw do
  root 'home#top'
  get '/home/about' => "home#about"
  devise_for :users
  resources :books
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update, :index] do
    get '/relationships/follow_index' => "relationships#follow_index"
    get '/relationships/follower_index' => "relationships#follower_index"
  end
end
