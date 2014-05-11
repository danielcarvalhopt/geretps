class Api::V1::PhasesController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_phases

  def index 
    respond_with(@phases)
  end
  
  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_phases
      @phases = if(params[:project_id])
        @user.projects.find(params[:project_id]).phases
      else
        @user.phases
      end
    end
end