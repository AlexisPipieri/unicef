Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :interventions, except: [:destroy] do
    resources :plaideurinterventions, only: [:new, :create, :index]
    end
  resources :ecoles, except: [:destroy]
  resources :users, except: [:destroy]


end
