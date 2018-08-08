Rails.application.routes.draw do
  get 'users/dashboard'
  get 'event_logs/show'
  get 'emergency_contacts/index'
  get 'emergency_contacts/show'
  get 'emergency_contacts/new'
  get 'emergency_contacts/create'
  get 'emergency_contacts/edit'
  get 'emergency_contacts/update'
  get 'emergency_contacts/destroy'
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
