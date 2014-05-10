Geretps::Application.routes.draw do
  root to: "pages#home"

  get "/dashboard" => "pages#dashboard", as: :dashboard
  get "/calendar" => "pages#calendar", as: :calendar
  get "/documents/file/:id" => "documents#show_file", as: :show_file
  post "/deliveries/add_document" => "deliveries#add_document", as: :add_document
  get "/deliveries/dowload_files_zip/:id" => "deliveries#dowload_files_zip", as: :dowload_files_zip
  post "/grades/evaluate_group" => "grades#evaluate_group", as: :evaluate_group

  get "/projects/:id/grades" => "projects#grades", as: :project_grades
  get "/projects/:id/groups" => "projects#groups", as: :project_groups
  get "/projects/:id/toggle_access" => "projects#toggle_access", as: :project_toggle_access
  get "/repository/" => "projects#search", as: :project_search
  get "/phases/:id/grades" => "phases#grades", as: :phase_grades

  post "/groups/:id/add_members" => "groups#add_members", as: :add_members

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", as: :logout
    get "/login" => "devise/sessions#new", as: :login
    get "/signup" => "devise/registrations#new", as: :signup
    get "/pwreset" => "devise/passwords#new", as: :pwreset
  end

  resources :teachers
  resources :assigned_students
  resources :members
  resources :students
  resources :groups
  resources :deliveries
  resources :grades
  resources :courses
  resources :phases
  resources :projects
  resources :required_files
  resources :students
  resources :tests
  resources :subjects
  resources :users
end
