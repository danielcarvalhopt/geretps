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
    @notifications = []
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
    if @user.teacher
      _dashboard_teacher
    else
      _dashboard_student
    end
  end

  private

    def _dashboard_student
      notifications = PublicActivity::Activity.order("created_at desc")
      projects = notifications.where(key: "project.create")
      deliveries = notifications.where(key: "delivery.create")
      shifts = notifications.where(key: "shift.create")

      projects.each do |project_notification|
        @notifications << project_notification if @user.project_ids.include?(project_notification.trackable_id)
      end

      @notifications << deliveries.where(owner_id: @user.group_ids).all
      shifts.each do |shift_notification|
        @notifications << shift_notification if @user.subject_ids.include?(shift_notification.trackable_id)
      end

      @notifications.flatten!
      @notifications.sort_by!(&:created_at)
      @notifications.reverse!
    end
    def _dashboard_teacher
      @project = Project.new
      notifications = PublicActivity::Activity.order("created_at desc")
      projects = notifications.where(key: "project.create")
      deliveries = notifications.where(key: "delivery.create")
      shifts = notifications.where(key: "shift.create")

      @notifications << projects.where(owner_id: @user.id).all
      deliveries.each do |delivery_notification|
        @notifications << delivery_notification if @user.project_ids.include?(delivery_notification.owner.project_id)
      end
      @notifications << shifts.where(owner_id: @user.id).all


      @notifications.flatten!
      @notifications.sort_by!(&:created_at)
      @notifications.reverse!
    end

    def set_user
      if current_user
        @user = current_user.student? ? current_user.student : current_user.teacher
      end
    end
end
