class Api::V1::SessionsController < Devise::SessionsController
    protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/vnd.geretps.v1' }

    def create
      warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      render :json => { :info => "Logged in", :authentication => {:user_email => current_user.email, :user_token => current_user.authentication_token} ,:user => current_user}, :status => 200
    end

    def destroy
      warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      sign_out
      render :json => { :info => "Logged out" }, :status => 200
    end

    def failure
      render :json => { :error => "Login Credentials Failed" }, :status => 401
    end
end
