Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  	resources :comments
  end
  get '/nusers/login' => 'sessions#new'
  post '/nusers/login' => 'sessions#create'
  get '/nusers/logout' => 'sessions#destroy'
  root 'posts#index'
  get '/nusers/signup' => 'nusers#new'
  post '/nusers/signup' => 'nusers#create'
end
