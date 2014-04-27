class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index]

  # GET /subjects
  # GET /subjects.json
  def index
    search = params[:search]
    search ||= ""
    @academic_years = @user.academic_years.uniq
    @subjects = @user.subjects
    @waiting_subjects = @user.waiting_subjects
    @subjects_filtered = filter_subjects(search)
    @assigned_student = AssignedStudent.new
    respond_json(@subjects)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
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

  private
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
