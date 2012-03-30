MoulinRougeDemo::Application.routes.draw do  
  devise_for :users

  resources :session, :only => [:new, :create, :destroy]
  resources :roles
  resources :users
  
  resources :posts do
    resources :comments
  end
  
  root :to => 'posts#index'
end
