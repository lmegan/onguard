Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :events do
      resources :event_logs, only: [:show]
    end
  end
  get "dashboard", to: "users#dashboard", as: "user_dashboard"
  resources :emergency_contacts
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
