Rails.application.routes.draw do
  # Home
  root to: "home#index"
  get 'home/try_it', to: 'home#add_guest', as: 'try_it'

  # Goals
  post '/goals/:id/update_progress', to: 'goals#update_progress', as: 'update_progress'
  post '/goals/:id/update_title', to: 'goals#update_title', as: 'update_title'
  post '/goals', to: 'goals#create', as: 'create_goal'

  # Devise Methods
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  get   "/users/:id/manage",            to: 'users#manage',            as: "manage_user"
  
end