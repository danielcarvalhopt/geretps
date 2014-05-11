class Api::V1::ProjectsController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_projects

  def index 
    respond_with(@projects)
  end

  def show
    project = @projects.find(params[:id])
    respond_with(project)
  end
  
  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_projects
      @projects = @user.projects
    end
end