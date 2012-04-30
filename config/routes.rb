MoulinRougeDemo::Application.routes.draw do  
  devise_for :users
  
  resource  :user
  resources :users, :except => [:show]
  resources :roles, :except => [:show]
  
  resources :posts do
    resources :comments, :except => [:show]
  end
  
  root :to => 'posts#index'
end
