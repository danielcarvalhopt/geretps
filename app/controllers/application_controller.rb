class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :require_login, unless: :devise_controller?, except: :home

  def after_sign_out_path_for(resource_or_scope)
    login_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :about, :phone, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :about, :phone, :email, :password, :password_confirmation)
    end
  end

  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  def respond_json(object)
    respond_with @users do |format|
      format.json { render :layout => false, :text => object.to_json }
    end
  end
end
