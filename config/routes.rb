Rails.application.routes.draw do
  resources :users, only: [:dashboard] do
    resources :emergency_contacts
    resources :events do
      resources :event_logs, only: [:show]
    end
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
