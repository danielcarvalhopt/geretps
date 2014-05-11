class Api::V1::GroupsController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_groups

  def index 
    respond_with(@groups)
  end

  def show
    group = @groups.find(params[:id])
    respond_with(group)
  end
  
  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_groups
      @groups = if(params[:project_id])
        @user.projects.find(params[:project_id]).groups
      elsif(params[:phase_id])
        @user.phases.find(params[:phase_id]).groups
      else
        @user.groups
      end
    end
end