Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :interventions, except: [:destroy]
  resources :plaideurinterventions, only: [:new, :create, :destroy]
  resources :ecoles, except: [:destroy]
  resources :users, except: [:destroy]



  get '/plaideurs', to: 'plaideurs#index'
  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ecoles, only: :show
    end
  end

end
