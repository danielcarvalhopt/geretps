Geretps::Application.routes.draw do
  root to: "pages#home"

  get "/dashboard" => "pages#dashboard", as: :dashboard
  get "/documents/file/:id" => "documents#show_file", as: :show_file 

  post "deliveries/add_document" => "deliveries#add_document", as: :add_document
  get "deliveries/dowload_files_zip/:id" => "deliveries#dowload_files_zip", as: :dowload_files_zip

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
