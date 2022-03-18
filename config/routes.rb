Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events do
        resources :results, only: %w[index show create]

        member do
          post 'subscribe'
          get 'competitors'
          get :ranking
        end
      end

      resources :auth do
        collection do
          post :signin
          post :signup
        end
      end
    end
  end
end
