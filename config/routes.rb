Geretps::Application.routes.draw do
  root to: "pages#home"
  get "/dashboard" => "pages#dashboard_docente"
  get "/project" => "pages#project"

  devise_for :users
end
