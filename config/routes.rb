# == Route Map
#

Rails.application.routes.draw do

  root 'api/v1/customers#index'

  resource :session
  resource :registration
  resource :password_reset
  resource :password

  namespace :api do
    namespace :v1 do
      root 'customers#index'

      resources :services
      resources :customers
      resources :antennas
      resources :providers
    end
  end

end
