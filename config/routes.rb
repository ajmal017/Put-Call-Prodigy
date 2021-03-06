Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :users do
    resources :robots, only: [:edit, :update]
  end

  resources :equities do
    resources :contracts, only: [:create, :new]
  end

  namespace :api do
    resources :graphs, only: [:create] do
      collection do
        get 'graph_data'
      end
    end
  end

#Need to add more "excepts" to sessions

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create"

  root 'sessions#new'
end
