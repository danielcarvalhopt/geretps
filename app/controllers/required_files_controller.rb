class RequiredFilesController < ApplicationController
  before_action :set_required_file, only: [:show, :edit, :update, :destroy]

  # GET /required_files
  # GET /required_files.json
  def index
    @required_files = RequiredFile.all
  end

  # GET /required_files/1
  # GET /required_files/1.json
  def show
  end

  # GET /required_files/new
  def new
    @required_file = RequiredFile.new
  end

  # GET /required_files/1/edit
  def edit
  end

  # POST /required_files
  # POST /required_files.json
  def create
    @required_file = RequiredFile.new(required_file_params)
    phase = Phase.find(required_file_params[:phase_id])
    @required_file.phase = phase

    respond_to do |format|
      if @required_file.save
        format.html { redirect_to phase, notice: 'Required file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @required_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @required_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /required_files/1
  # PATCH/PUT /required_files/1.json
  def update
    respond_to do |format|
      if @required_file.update(required_file_params)
        format.html { redirect_to @required_file, notice: 'Required file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @required_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /required_files/1
  # DELETE /required_files/1.json
  def destroy
    @required_file.destroy
    respond_to do |format|
      format.html { redirect_to required_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_required_file
      @required_file = RequiredFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def required_file_params
      params.require(:required_file).permit(:name, :description, :phase_id)
    end
end
