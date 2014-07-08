Geretps::Application.routes.draw do
  root to: "pages#home"

  get "/dashboard" => "pages#dashboard", as: :dashboard
  get "/calendar" => "pages#calendar", as: :calendar
  get "/documents/file/:id" => "documents#show_file", as: :show_file
  post "/deliveries/add_document" => "deliveries#add_document", as: :add_document
  get "/deliveries/dowload_files_zip/:id" => "deliveries#dowload_files_zip", as: :dowload_files_zip
  post "/grades/evaluate_group" => "grades#evaluate_group", as: :evaluate_group

  get "/oai" , to: "oai#index", as: :oai

  get "/projects/:id/grades" => "projects#grades", as: :project_grades
  get "/phases/:id/add_phase_file" => "phases#add_phase_file", as: :phase_add_phase_file
  get "/projects/:id/groups" => "projects#groups", as: :project_groups
  get "/projects/:id/toggle_access" => "projects#toggle_access", as: :project_toggle_access
  get "/phase/:id/toggle_access" => "phases#toggle_access", as: :phase_toggle_access
  get "/phase/:id/toggle_grades" => "phases#toggle_grades", as: :phase_toggle_grades
  get "/repository/" => "projects#search", as: :project_search
  get "/phases/:id/grades" => "phases#grades", as: :phase_grades
  get "/subjects/:id/shifts" => "subjects#shifts", as: :subject_shifts
  get "/subjects/:id/students" => "subjects#students", as: :subject_students

  post "/groups/:id/add_members" => "groups#add_members", as: :add_members
  post "/subjects/:id/add_teachers" => "subjects#add_teachers", as: :add_teachers
  post "/subjects/:id/shifts/add_students" => "subjects#add_students_to_shift", as: :add_students_shift
  patch "/assigned_students/:id/accept_student" => "assigned_students#accept_student", as: :accept_student
  patch "/assigned_students/:id/remove_student_shift" => "assigned_students#remove_student_shift", as: :remove_student_shift

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", as: :logout
    get "/login" => "devise/sessions#new", as: :login
    get "/signup" => "devise/registrations#new", as: :signup
    get "/pwreset" => "devise/passwords#new", as: :pwreset
  end



  resources :teachers
  resources :assigned_students
  resources :assigned_teachers
  resources :members
  resources :students
  resources :groups
  resources :deliveries
  resources :grades
  resources :courses
  resources :phases
  resources :phase_files
  resources :documents
  resources :projects
  resources :required_files
  resources :students
  resources :tests
  resources :subjects
  resources :users
  resources :shifts

  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      devise_scope :user do
        match '/sessions' => 'sessions#create', :via => :post
        match '/sessions' => 'sessions#destroy', :via => :delete
      end

      get "/projects" => "projects#index"
      get "/projects/:id" => "projects#show"

      get "/phases" => "phases#index"
      get "/phases/:id" => "phases#show"
      get "/projects/:project_id/phases" => "phases#index"

      get "/groups" => "groups#index"
      get "/groups/:id" => "groups#show"
      get "/projects/:project_id/groups" => "groups#index"
      get "/phases/:phase_id/groups" => "groups#index"

      get "/deliveries" => "deliveries#index"
      get "/deliveries/:id" => "deliveries#show"
      get "/phases/:phase_id/deliveries" => "deliveries#index"
      get "/phases/:phase_id/groups/:group_id/deliveries" => "deliveries#index"

      get "/documents" => "documents#index"
      get "/documents/:id" => "documents#show"
      get "/deliveries/:delivery_id/documents" => "documents#index"

      get "/documents/:id/download" => "documents#download"
    end
  end
end

