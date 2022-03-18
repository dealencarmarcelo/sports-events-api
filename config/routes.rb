Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events do
        resources :results

        member do
          post 'subscribe'
          get 'competitors'
        end

        member do
          get :ranking
        end
      end

      resources :auth do
        collection do
          post :signin
          post :signup
        end
      end

      resources :users
    end
  end
end
