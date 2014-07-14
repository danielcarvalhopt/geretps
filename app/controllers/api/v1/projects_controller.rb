require "export/xls.rb"
require "export/xsl.rb"

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

  def export_final_grades
    project = Project.find(params[:id])
    export = Export::XLS.new project
    export.final_grades
    loc = Rails.root.join('public/export',"final_grades_#{project.id}.xlsx")
    send_file(loc, :filename => "final_grades_#{project.id}.xlsx", :type => "application/xlsx")
  end

  def export_final_grades_pdf
    project = Project.find(params[:id])
    export = Export::XSL.new project
    export.xml
    loc = Rails.root.join('public/export',"final_grades_#{project.id}.pdf")
    send_file(loc, :filename => "final_grades_#{project.id}.pdf", :type => "application/pdf")
  end

  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_projects
      @projects = @user.projects
    end
end
