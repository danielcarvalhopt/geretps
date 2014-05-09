class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :add_teachers, :shifts, :add_students_to_shift]
  before_action :set_user, only: [:index, :show, :shifts]

  # GET /subjects
  # GET /subjects.json
  def index
    search = params[:search]
    search ||= ""
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
    if @user.student?
      @waiting_subjects = @user.waiting_subjects
    end
    @subjects_filtered = filter_subjects(search)
    @assigned_student = AssignedStudent.new
    respond_json(@subjects)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @projects = @subject.projects
    _show_teacher
    respond_json(@subject)
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subject }
      else
        format.html { render action: 'new' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  def add_teachers
    new_teachers_ids = params[:subject][:teachers]

    if new_teachers_ids.count <= 1
      flash[:error] = 'Nenhum docente selecionado.'
      return redirect_to subject_path @subject
    end

    new_teachers_ids.each do |new_id|
      if !new_id.blank?
        assignedTeacher = AssignedTeacher.new teacher_id: new_id, subject_id: @subject.id
        if !assignedTeacher.save!
          flash[:error] = 'Erro ao adicionar um docente.'
          return redirect_to subject_path @subject
        end
      end
    end

    respond_to do |format|
      format.html {
        flash[:notice] = 'Docentes adicionados com sucesso.'
        redirect_to subject_path @subject
      }
      format.json { head :no_content }
    end
  end

  def shifts
    @shifts = @subject.shifts
    @shift = Shift.new
  end

  def add_students_to_shift
    new_students_ids = params[:subject][:students]
    shift_id = params[:subject][:shift_ids]

    if !shift_id
      flash[:error] = "Nenhum Turno selecionado"
      return redirect_to subject_shifts_path @subject
    end

    if new_students_ids.count <= 1
      flash[:error] = "Nenhum aluno selecionado"
      return redirect_to subject_shifts_path @subject
    end

    new_students_ids.each do |new_id|
      if !new_id.blank?
        student = @subject.assigned_students.where(student_id: new_id).first
        if student
          student.shift_id = shift_id
          if !student.save!
            flash[:error] = "Erro ao adicionar um aluno"
            return redirect_to subject_shifts_path @subject
          end
         else
          flash[:error] = "Erro ao adicionar um aluno"
          return redirect_to subject_shifts_path @subject
        end
      end
    end

    respond_to do |format|
      format.html {
        flash[:notice] = 'Alunos adicionados com sucesso.'
        redirect_to subject_shifts_path @subject
      }
      format.json { head :no_content }
    end
  end



  private

    def _show_teacher
      @project = Project.new
      @notifications = [];
    end

    def filter_subjects(search)
      subjects_filtered = []
      Subject.all.each do |subject|
        if subject.assigned_students.find_by(student_id: @user.id).nil?
          subjects_filtered << subject
        end
      end
      if !subjects_filtered.blank?
        if search == ""
          subjects_filtered = subjects_filtered.take 4
        else
          subjects_filtered = Subject.find_by_fuzzy_name(search) & subjects_filtered
        end
      end
      subjects_filtered
    end

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :academic_year_id, :course_id, :responsible_id)
    end
end
