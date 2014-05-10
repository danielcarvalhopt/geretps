class AssignedTeachersController < ApplicationController
  before_action :set_assigned_teacher, only: [:show, :edit, :update, :destroy]

  # GET /assigned_teachers
  # GET /assigned_teachers.json
  def index
    @assigned_teachers = AssignedTeacher.all
  end

  # GET /assigned_teachers/1
  # GET /assigned_teachers/1.json
  def show
  end

  # GET /assigned_teachers/new
  def new
    @assigned_teacher = AssignedTeacher.new
  end

  # GET /assigned_teachers/1/edit
  def edit
  end

  # POST /assigned_teachers
  # POST /assigned_teachers.json
  def create
    @assigned_teacher = AssignedTeacher.new(assigned_teacher_params)

    respond_to do |format|
      if @assigned_teacher.save
        format.html { redirect_to @assigned_teacher, notice: 'Assigned teacher was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assigned_teacher }
      else
        format.html { render action: 'new' }
        format.json { render json: @assigned_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assigned_teachers/1
  # PATCH/PUT /assigned_teachers/1.json
  def update
    respond_to do |format|
      if @assigned_teacher.update(assigned_teacher_params)
        format.html { redirect_to @assigned_teacher, notice: 'Assigned teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assigned_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_teachers/1
  # DELETE /assigned_teachers/1.json
  def destroy
    @assigned_teacher.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: "Docente removido com sucesso desta Unidade Curricular" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assigned_teacher
      @assigned_teacher = AssignedTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assigned_teacher_params
      params.require(:assigned_teacher).permit(:teacher_id, :subject_id)
    end
end
