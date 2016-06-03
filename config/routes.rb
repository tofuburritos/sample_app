Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # root 'static_pages#home' #Рут - страничка авторизации.
  root 'sessions#new'
  #Sessions Block
  # match '/signin',  to: 'sessions#new',         via:    'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  #Static Pages Block
  match '/home',    to: 'static_pages#home',    via:    'get'
  match '/help',    to: 'static_pages#help',    via:    'get'
  ######
  match '/readapp', to: 'static_pages#readapp', via:    'get'
  match '/formapp', to: 'static_pages#formapp', via:    'get'
  match '/call',    to: 'static_pages#call',    via:    'get'
  #Users Block
  match '/edit',    to: 'users#edit',           via:    'get'
  match '/signup',  to: 'users#new',            via:    'get'
end
