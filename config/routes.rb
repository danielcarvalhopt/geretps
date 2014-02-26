Geretps::Application.routes.draw do
  root to: "pages#home"

  get "/dashboard" => "pages#dashboard", as: :dashboard
  get "/students/dashboard" => "students#dashboard", as: :student_dashboard
  get "/teachers/dashboard" => "teachers#dashboard", as: :teacher_dashboard

  get "/documents/file/:id" => "documents#show_file", as: :show_file 

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", as: :logout
    get "/login" => "devise/sessions#new", as: :login
    get "/signup" => "devise/registrations#new", as: :signup
    get "/pwreset" => "devise/passwords#new", as: :pwreset
  end

  resources :teachers
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
end
