Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :interventions, except: [:destroy]
  resources :ecoles, except: [:destroy]
  resources :users, except: [:destroy]
  resources :plaideurinterventions, except: [:show, :index]


  get '/plaideurs', to: 'plaideurs#index'
  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ecoles, only: :show
    end
  end

end
