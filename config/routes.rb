Rails.application.routes.draw do
  root 'users#new'
  get 'sessions/login', to: 'sessions#login', as: :new_session
  post 'sessions/login', to: 'sessions#check'
  delete 'sessions/logout', to: 'sessions#destroy', as: :destroy_session
  get 'event_attendings/index', to: 'event_attendings#index'
  put 'event_attendings/attend', to: 'event_attendings#attend'
  resources :users, only:[:new, :create, :show]
  resources :events, only:[:new, :create, :show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
