Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:index, :create]
      patch '/subscriptions', to: 'subscriptions#update'
    end
  end

end
