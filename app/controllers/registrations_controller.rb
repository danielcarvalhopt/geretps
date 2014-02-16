class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    if params[:type]=="teacher"
      @teacher = Teacher.new
      @teacher.user_id = @user.id
      @teacher.save
    elsif params[:type]=="student"
      @student = Student.new
      @student.user_id = @user.id
      @student.identifier = params[:identifier]
      @student.save
    end
  end

  def update
    super
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :about, :phone, :email, :password, :password_confirmation, :encrypted_password, :identifier)
  end
end 
