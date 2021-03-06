Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :person, only: [:show] do
        resources :animals
      end
      resources :people, only: [:index]
      resources :animal_types
      resources :animals, only: :index
    end
  end
end
