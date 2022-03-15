Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :events
      resources :results
      resources :users do
        member do
          get :results
          get :events
        end
      end
    end
  end
end
