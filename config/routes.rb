MoulinRougeDemo::Application.routes.draw do  
  devise_for :users
  
  resource  :user
  resources :users, :except => [:show]
  resources :roles, :except => [:show]
  
  resources :posts do
    resources :comments, :only => [:create, :destroy]
  end
  
  root :to => 'posts#index'
end
