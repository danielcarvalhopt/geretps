class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy, :grades]
  before_action :set_user

  # GET /phases
  # GET /phases.json
  def index
    @phases = Phase.all
    respond_json(@phases)
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
    if current_user.student?
      _show_student
    else
      _show_teacher
    end
    respond_json(@phase)
  end

  # GET /phases/new
  def new
    @phase = Phase.new
  end

  # GET /phases/1/edit
  def edit
  end

  def grades
    @project = @phase.project
    @students = @project.students
  end

  # POST /phases
  # POST /phases.json
  def create
    
    @phase = Phase.new(phase_params)
    @phase.project = Project.find(phase_params[:project_id])
    if (phase_params[:name]=="") or (phase_params[:begin_date]=="") or (phase_params[:end_date]=="") or (phase_params[:value]=="")
       return redirect_to @phase.project, alert: 'ERRO: O nome, a valoração, data de ínicio e de término são obrigatórios para a criação de uma nova fase. Por favor, tente <a data-toggle="modal" href="#newPhase">criar novamente a fase.</a>'.html_safe
    end
    phasefile = PhaseFile.new
    statement = phase_params[:statement]

    if phase_params[:end_date]
      if @phase.project.end_date == nil or @phase.project.end_date < phase_params[:end_date]
        @phase.project.end_date = phase_params[:end_date]
        @phase.project.save
      end
    end

    if !statement.blank?
      document = Document.new file: statement, name: statement.original_filename
      if document.save
        phasefile.document = document
      else
        flash[:error] = "Erro ao adicionar o enunciado."
      end
    end

    respond_to do |format|
      if @phase.save 
        format.html { redirect_to @phase, notice: 'Fase criada com sucesso!' }
        format.json { render action: 'show', status: :created, location: @phase }
      else
        format.html { redirect_to @phase.project, alert: 'ERRO: Não foi possível criar a fase com sucesso. Por favor, tente <a data-toggle="modal" href="#newPhase">criar novamente a fase.</a>'.html_safe }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
      if !statement.blank?
        phasefile.phase = @phase
        phasefile.save 
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    if (phase_params[:name]=="") or (phase_params[:begin_date]=="") or (phase_params[:end_date]=="") or (phase_params[:value]=="")
       return redirect_to @phase, alert: 'ERRO: O nome, a valoração, data de ínicio e de término são obrigatórios para a definição de uma fase. Por favor, tente <a data-toggle="modal" href="#editPhase">voltar a editar.</a>'.html_safe
    end
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase, notice: 'Fase atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @phase, alert: 'ATENÇÃO! Não foi possível alterar a fase com sucesso. Por favor, tente <a data-toggle="modal" href="#editPhase">alterar novamente a fase.</a>'.html_safe }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to phases_url }
      format.json { head :no_content }
    end
  end

  def toggle_access
    @phase = Phase.find(params[:id]).toggle(:open)
    @phase.save
    respond_to do |format|
      format.html { redirect_to @phase, notice: 'Fase alterada com sucesso!' }
      format.json { head :no_content }
    end
  end

  def toggle_grades
    @phase = Phase.find(params[:id]).toggle(:grades)
    @phase.save
    respond_to do |format|
      format.html { redirect_to @phase, notice: 'Fase alterada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    def _show_student
      @project = @phase.project
      @phases = @project.phases
      @delivery = Delivery.new
      @group = @project.group_of current_user.student.id
    end

    def _show_teacher
      @project = @phase.project
      @phases = @project.phases
    end

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phase
      @phase = Phase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_params
      params.require(:phase).permit(:name, :description, :begin_date, :end_date, :open, :grades, :grades, :value, :statement_id, :project_id)
    end
end
