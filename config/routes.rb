Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events do
        resources :results, only: %w[index show create]
        member do
          get :ranking
          post :subscribe
          get :competitors
        end
      end

      resources :users
    end
  end
end
