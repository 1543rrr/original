Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
 

  # resources :posts do
  resources :users
  resources :posts, only: [:index,:new,:create,:destroy,:edit,:update,:show]
  # resources :posts, only: %i(new create) do
  # resources :photos, only: %i(create)
  # end
# end


end 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

