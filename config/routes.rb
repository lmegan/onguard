Rails.application.routes.draw do
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  resources :events do
    member do
      post :deactivate
    end
    resources :event_logs, only: [:show]
  end
  resources :emergency_contacts
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  patch "complete_profile", to: "users#complete_profile", as: "complete_profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/emergency_contact", to: "users#panic_button", as: "emergency"
    # patch "/deactivate", to: "events#deactivate", as: "deactivate"



end
