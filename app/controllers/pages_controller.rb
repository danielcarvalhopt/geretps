class PagesController < ApplicationController
  before_action :set_user, only: [:dashboard, :home]

  def home
  end

  def dashboard
    @projects = @user.projects
    @notifications = @user.notifications.take 3
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
  end

  private
    def set_user
      if current_user
        @user = current_user.student? ? current_user.student : current_user.teacher
      end
    end
end
