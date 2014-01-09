Geretps::Application.routes.draw do
  devise_for :users

  get "/home" => "pages#home"
end
