Rails.application.routes.draw do
  
  resources :friendships
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :trips
      resources :users
      resources :locations
      get '/by_username/:username', to: 'users#login'
    end
   end
  
end
