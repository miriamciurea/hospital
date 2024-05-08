Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/registrations/sessions'
  }
  # resources :users, only: [:index, :show]
  root to: "users#show"
  # resources :patients, only: [:destroy]
  delete '/patients/:id', to: 'patients#destroy', as: 'delete_patient'
  resources :patients, only: [:show, :index, :new, :create, :edit, :update]
  resources :users, only: [:index, :show] do
    resources :patients, only: [:show] do
      resources :appointments, only: [:new, :create, :edit, :update]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
