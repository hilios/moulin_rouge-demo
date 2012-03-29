MoulinRougeDemo::Application.routes.draw do  
  resources :session, :only => [:new, :create, :destroy]
  resources :roles
  resources :users
  
  resources :posts do
    resources :comments
  end
end
