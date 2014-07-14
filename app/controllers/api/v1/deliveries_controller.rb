class Api::V1::DeliveriesController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_deliveries

  def index
    respond_with(@deliveries)
  end

  def grades
    delivery = @deliveries.find(params[:id])
    respond_with(delivery.grades)
  end

  def show
    delivery = @deliveries.find(params[:id])
    respond_with(delivery)
  end

  def eval_group
    delivery = @deliveries.find(params[:id])
    group = Group.find(params[:group])
    value = params[:value]
    comment = params[:comment]


    group.students.each do |s|
      d = Grade.where(delivery_id: delivery.id, student_id: s.id).first
      d = Grade.new(delivery_id: delivery.id, student_id: s.id) unless d

      d.value = value
      d.comments = comment if comment
      d.save!
    end
    respond_with(delivery)
  end

  def eval_student
    delivery = @deliveries.find(params[:id])
    student = Student.find(params[:student])
    value = params[:value]
    comment = params[:comment]

    d = Grade.where(delivery_id: delivery.id, student_id: student.id).first
    d = Grade.new(delivery_id: delivery.id, student_id: student.id) unless delivery
    d.value = value
    d.comments = comment if comment
    d.save!

    respond_with(delivery)
  end

  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_deliveries
      @deliveries = if(params[:group_id] and params[:phase_id])
        @user.phases.find(params[:phase_id]).deliveries_of(params[:group_id])
      elsif(params[:group_id])
        @user.groups.find(params[:group_id]).deliveries
      elsif(params[:phase_id])
        @user.phases.find(params[:phase_id]).deliveries
      else
        @user.deliveries
      end
    end
end
