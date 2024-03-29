class AssignedStudentsController < ApplicationController
  before_action :set_assigned_student, only: [:show, :edit, :update, :destroy, :accept_student, :remove_student_shift]
  before_action :set_user

  # GET /assigned_students
  # GET /assigned_students.json
  def index
    @assigned_students = AssignedStudent.all
  end

  # GET /assigned_students/1
  # GET /assigned_students/1.json
  def show
  end

  # GET /assigned_students/new
  def new
    @assigned_student = AssignedStudent.new
  end

  # GET /assigned_students/1/edit
  def edit
  end

  # POST /assigned_students
  # POST /assigned_students.json
  def create
    @assigned_student = AssignedStudent.new(assigned_student_params)

    respond_to do |format|
      if @assigned_student.save
        format.html {
          redirect_to subjects_path, notice: 'Inscrição submetida com sucesso.'
        }
        format.json { render action: 'show', status: :created, location: @assigned_student }
      else
        format.html {
          redirect_to subjects_path, flash: {error: 'Erro ao submeter inscrição.' }
        }
        format.json { render json: @assigned_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigned_students/1
  # PATCH/PUT /assigned_students/1.json
  def update
    respond_to do |format|
      if @assigned_student.update(assigned_student_params)
        format.html { redirect_to :back, notice: 'Aluno removido do turno com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assigned_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_students/1
  # DELETE /assigned_students/1.json
  def destroy
    accepted = @assigned_student.accepted
    subject_name = @assigned_student.subject.name
    @assigned_student.destroy
    respond_to do |format|
      format.html {

        if accepted
          if @user.teacher
            notice = "Aluno removido com êxito"
          else
            notice = "Saiu da unidade curricular de #{subject_name}."
          end
        else
          notice = "Cancelou a inscrição na unidade curricular de #{subject_name}."
        end

        flash[:notice] = notice
        redirect_to :back
      }
      format.json { head :no_content }
    end
  end

  def accept_student
    @assigned_student.accepted = true
    respond_to do |format|
      format.html{
        if @assigned_student.save!
          notice = "#{@assigned_student.student.name} adicionado com êxito"
        else
          notice = "Erro ao adicionar o aluno à Unidade Curricular"
        end

        flash[:notice] = notice
        redirect_to :back
      }
      format.json {head :no_content}
    end
  end

  def remove_student_shift
    @assigned_student.shift = nil
    respond_to do |format|
      if @assigned_student.save!
        format.html { redirect_to :back, notice: 'Aluno removido do turno com sucesso' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Erro ao remover aluno do turno' }
        format.json { render json: @assigned_student.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_assigned_student
      @assigned_student = AssignedStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assigned_student_params
      params.require(:assigned_student).permit(:student_id, :subject_id, :shift_id)
    end
end
