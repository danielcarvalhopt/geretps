class GradesController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def evaluate_group
    delivery = Delivery.find(params[:delivery_id])
    valid = 0
    invalid = 0

    students_params = params[:students]
    students_params.keys.each do |student_id|
      if !students_params[student_id]['grade'].blank?
        Grade.where(student_id: student_id, delivery_id: delivery.id).first_or_initialize.tap do |grade|
          grade.value = students_params[student_id]['grade']
          grade.comments = students_params[student_id]['comment'] if !students_params[student_id]['comment'].blank?

          grade.save ? valid+=1 : invalid+=1
        end
      end
    end

    if invalid>0
      flash[:error] = "Erro ao atualizar a avaliação  de #{invalid} utilizador#{"es" if invalid>1}."
    elsif valid>0
      flash[:notice] = "Atualizou com sucesso a avaliação  de #{valid} utilizador#{"es" if valid>1}."
    end

    redirect_to delivery
  end

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
    respond_json(@grades)
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
    respond_json(@grade)
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @grade }
      else
        format.html { render action: 'new' }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:value, :comments, :delivery_id, :student_id)
    end
end
