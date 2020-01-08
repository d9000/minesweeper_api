Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: %i[index show]
      resources :users do
        resources :games, controller: 'users/games'
      end
    end
  end
end
