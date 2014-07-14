require "export/xls.rb"
require "export/xsl.rb"

class Api::V1::PhasesController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_phases

  def index
    respond_with(@phases)
  end

  def show
    phase = @phases.find(params[:id])
    respond_with(phase)
  end

  def export_phase_grades
    phase = Phase.find(params[:id])

    export = Export::XLS.new phase.project
    export.phase_grades phase
    loc = Rails.root.join('public/export',"phase_#{phase.project.id}_grades_#{phase.project.id}.xlsx")
    send_file(loc, :filename => "phase_#{phase.project.id}_grades_#{phase.project.id}.xlsx", :type => "application/xlsx")
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
