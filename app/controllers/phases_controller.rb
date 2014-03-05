class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /phases
  # GET /phases.json
  def index
    @phases = Phase.all
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
    @project = @phase.project
    @phases = @project.phases
    Rails.cache.write("phase_documents", [])
    @delivery = Delivery.new
    @group = @project.group_of current_user.student.id
  end

  # GET /phases/new
  def new
    @phase = Phase.new
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  # POST /phases.json
  def create
    @phase = Phase.new(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to @phase, notice: 'Phase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @phase }
      else
        format.html { render action: 'new' }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase, notice: 'Phase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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

  private
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
