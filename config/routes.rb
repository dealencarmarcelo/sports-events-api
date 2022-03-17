Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events do
        resources :results
        member do
          get :ranking
        end
      end

      resources :users
    end
  end
end
