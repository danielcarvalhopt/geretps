Geretps::Application.routes.draw do
  root to: "pages#home"
  get "/project" => "pages#project"
  get "t_dashboard" => "teachers#dashboard"
  get "s_dashboard" => "students#dashboard"


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
