Bananas::Application.routes.draw do
  resources :bananas
  root :to => 'bananas#index'
end
