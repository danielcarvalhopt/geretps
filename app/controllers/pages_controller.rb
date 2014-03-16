class PagesController < ApplicationController
  before_action :set_user, only: [:dashboard, :home, :calendar]

  def home
  end

  def calendar
    @phases = []
    Phase.all.each do |phase|
      @phases << phase if !phase.project.group_of(@user.id).nil?
    end
  end

  def dashboard
    @projects = @user.projects
    @notifications = PublicActivity::Activity.order("created_at desc")
    #@notifications = @user.notifications.take 3
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
    if @user.teacher
      _dashboard_teacher
    end
  end

  private
    def _dashboard_teacher
      @project = Project.new
    end

    def set_user
      if current_user
        @user = current_user.student? ? current_user.student : current_user.teacher
      end
    end
end
