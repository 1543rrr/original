Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index,:new,:create,:destroy,:edit,:update]
end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

