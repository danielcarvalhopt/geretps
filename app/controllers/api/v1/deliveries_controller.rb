class Api::V1::DeliveriesController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_deliveries

  def index 
    respond_with(@deliveries)
  end
  
  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_deliveries
      @deliveries = if(params[:phase_id])
        @user.projects.find(params[:phase_id]).deliveries
      else
        @user.deliveries
      end
    end
end