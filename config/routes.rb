Rails.application.routes.draw do
  resources :dgrs
  resources :stats
  resources :stocks
  root :to => 'stocks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
