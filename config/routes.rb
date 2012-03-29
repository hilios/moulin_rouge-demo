MoulinRougeDemo::Application.routes.draw do  
  resources :session, :only => [:new, :create, :destroy]
  resources :roles
  resources :users
end
