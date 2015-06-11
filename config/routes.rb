Rails.application.routes.draw do
  root to: "home#index"
  get  '/index2', to: 'home#index2', as: 'index2'
  post '/goals/:id/update_day', to: 'goals#update_day', as: 'update_day'
  post '/goals/:id/update_title', to: 'goals#update_title', as: 'update_title'
  post '/goals', to: 'goals#create', as: 'create_goal'

  # Client Methods
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  # resources :users do
  #   resources :jobs, only: [:new, :create, :show, :update, :index]
  # end

  # get '/portal', to: 'users#portal', as: 'portal'

  # resources :procedures
  # get   '/procedure/:id',         to: 'procedures#show', as: 'procedure_show'

  # resources :consents
  # get '/consents', to: 'consents#index', as: 'consents'

  # get '/procedure/:procedure_id/consent/create', to: 'consents#create', as: 'create_consent'
  # get '/procedure/:procedure_id/consent/:consent_id', to: 'consents#show', as: 'show_consent'
  # get '/procedure/:id/consent/:consent_id/update', to: 'consents#update', as: 'update_consent'

  # get '/procedure/:procedure_id/consent/new', to: 'consents#new', as: 'consent_new'
  # get '/procedure/:procedure_id/consent/:consent_id/indications', to: 'consents#indications', as: 'consent_indications'
  # get '/procedure/:procedure_id/consent/:consent_id/benefits', to: 'consents#benefits', as: 'consent_benefits'
  # get '/procedure/:procedure_id/consent/:consent_id/risks', to: 'consents#risks', as: 'consent_risks'
  # get '/procedure/:procedure_id/consent/:consent_id/alternatives', to: 'consents#alternatives', as: 'consent_alternatives'
  # get '/procedure/:procedure_id/consent/:consent_id/description', to: 'consents#description', as: 'consent_description'

  # post '/contact_us',            to: 'messages#contact_us',            as: 'contact_us'
  # post '/mailgun_receive_email', to: 'messages#mailgun_receive_email', as: 'mailgun_receive_email'

  # Proofreader methods
  resources :users, only: [:index]
  # resources :messages, only: [:index]
  get   "/users/:id/manage",            to: 'users#manage',            as: "manage_user"
  # patch "/users/:id/management_update", to: 'users#management_update', as: "user_management_update"

  # get   'all_jobs', to: 'jobs#all_jobs', as: 'all_jobs'
  # get   'jobs/:id/manage',         to: 'jobs#manage', as: 'job_manage'
  # patch 'jobs/:id/manage_update',  to: 'jobs#manage_update'
  # post  'tasks/:id/start',         to: 'tasks#create_timer'
  # patch 'timers/:id/end',          to: 'timers#end_timer', as: 'end_timer'
  # patch 'tasks/:id/upload',        to: 'tasks#upload_files' # Is this a post route, Only file uploaded as sub element to task
  # patch 'tasks/:id/mark_complete', to: 'tasks#mark_complete'
  # patch 'jobs/:id/proofreader_message', to: 'jobs#send_client_email'

  # resources :charges, :only => [:new]
  # post '/buy_credits', to: 'charges#buy_credits', as: 'buy_credits'
  
end