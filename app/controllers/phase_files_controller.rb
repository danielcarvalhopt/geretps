class PhaseFilesController < ApplicationController
  before_action :set_phase_file, only: [:show, :edit, :update, :destroy]

  # GET /phase_files
  # GET /phase_files.json
  def index
    @phase_files = PhaseFile.all
    respond_json(@phase_files)
  end

  # GET /phase_files/1
  # GET /phase_files/1.json
  def show
    respond_json(@phase_file)
  end

  # GET /phase_files/new
  def new
    @phase_file = PhaseFile.new
  end

  # GET /phase_files/1/edit
  def edit
  end

  # POST /phase_files
  # POST /phase_files.json
  def create
    phase_file = PhaseFile.new
    phase_file.phase = Phase.find(phase_file_params[:phase_id])

    if !(phase_file_params[:file].blank?)
      document = Document.new file: phase_file_params[:file], name: phase_file_params[:name], description: phase_file_params[:description]
      if document.save
        phase_file.document = document
      else
        flash[:error] = "Erro ao adicionar o ficheiro."
      end
    else
    end
    respond_to do |format|
      if phase_file.save
        format.html { redirect_to phase_file.phase, notice: 'Ficheiro adicionado com sucesso' }
        format.json { render action: 'show', status: :created, location: phase_file }
      else
        format.html { render action: 'new' }
        format.json { render json: phase_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phase_files/1
  # PATCH/PUT /phase_files/1.json
  def update
    respond_to do |format|
      if @phase_file.update(phase_files_params)
        format.html { redirect_to @phase_file, notice: 'PhaseFile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @phase_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phase_files/1
  # DELETE /phase_files/1.json
  def destroy
    @phase_file.destroy
    respond_to do |format|
      format.html { redirect_to phase_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase_file
      @phase_file = PhaseFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_file_params
      params.require(:phase_file).permit(:document_id, :phase_id, :name,  :description, :file)
    end
end
