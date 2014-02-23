class PagesController < ApplicationController
  def home
  end

  def dashboard
    if current_user.student?
      redirect_to student_dashboard_path
    else
      redirect_to teacher_dashboard_path
    end
  end
end
