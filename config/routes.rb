Rails.application.routes.draw do
  devise_for :users
  resources :providers
  resources :antennas
  namespace :api do
    namespace :v1 do 
      resources :services
      resources :customers
    end
  end
end
