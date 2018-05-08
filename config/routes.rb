Rails.application.routes.draw do
  devise_for :users
  root 'home#index' 
  post 'subscribe', to: 'events#subscribe', as: 'subscribe'
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
