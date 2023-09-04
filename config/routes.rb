Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      root 'customers#index'

      resources :services
      resources :customers
      resources :antennas
      resources :providers
    end
  end

  devise_for :users

end
