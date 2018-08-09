Rails.application.routes.draw do
  resources :users, only: [:dashboard] do
    resources :events do
      resources :event_logs, only: [:show]
    end
  end
      resources :emergency_contacts

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
