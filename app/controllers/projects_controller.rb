class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :groups, :grades]
  before_action :set_user

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    respond_json(@projects)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if current_user.student?
      _show_student
    else
      _show_teacher
    end
    respond_json(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    statement = params[:statement]

    if !statement.blank?
      document = Document.new file: statement, name: statement.original_filename
      if document.save
        @project.statement = document
      else
        flash[:error] = "Erro ao adicionar o enunciado ao projeto, o projeto foi criado sem enunciado."
      end
    end

    if @project.save
      flash[:notice] = "Projeto criado com sucesso." if flash[:error].blank?
      redirect_to @project
    else
      flash[:error] = "Erro ao criar novo projeto, verifique todos os parâmetros."
      redirect_to dashboard_path
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def groups
      @groups = @project.groups.sort{|a,b| a.identifier <=> b.identifier}
      @group = @project.group_of current_user.student.id
      @member = Member.new
      @students_without_group = @project.students_without_group
  end

  def grades
    @students = @project.subject.students.sort_by {|s|s.identifier}
  end

  private
    def _show_teacher
      @notifications = @project.notifications.take 5
      @phases = @project.phases
      @deliveries = @project.deliveries.take 4
      @teachers = @project.subject.teachers
    end

    def _show_student
      @notifications = @project.notifications.take 5
      @phases = @project.phases
      @group = @project.group_of current_user.student.id
      @deliveries = @project.deliveries_of(@group.try(:id)).take 4
      @teachers = @project.subject.teachers
    end

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :begin_date, :end_date, :public, :grades, :open, :max_elems, :min_elems, :subject_id, :statement_id)
    end
end
