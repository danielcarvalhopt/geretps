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
      @student.identifier = "0"
      @student.save
    end
  end

  def update
    super
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :about, :phone, :email, :password, :password_confirmation, :encrypted_password)
  end
end 
