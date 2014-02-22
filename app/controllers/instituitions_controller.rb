class InstituitionsController < ApplicationController
  before_action :set_instituition, only: [:show, :edit, :update, :destroy]

  # GET /instituitions
  # GET /instituitions.json
  def index
    @instituitions = Instituition.all
  end

  # GET /instituitions/1
  # GET /instituitions/1.json
  def show
  end

  # GET /instituitions/new
  def new
    @instituition = Instituition.new
  end

  # GET /instituitions/1/edit
  def edit
  end

  # POST /instituitions
  # POST /instituitions.json
  def create
    @instituition = Instituition.new(instituition_params)

    respond_to do |format|
      if @instituition.save
        format.html { redirect_to @instituition, notice: 'Instituition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @instituition }
      else
        format.html { render action: 'new' }
        format.json { render json: @instituition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituitions/1
  # PATCH/PUT /instituitions/1.json
  def update
    respond_to do |format|
      if @instituition.update(instituition_params)
        format.html { redirect_to @instituition, notice: 'Instituition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instituition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituitions/1
  # DELETE /instituitions/1.json
  def destroy
    @instituition.destroy
    respond_to do |format|
      format.html { redirect_to instituitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instituition
      @instituition = Instituition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instituition_params
      params.require(:instituition).permit(:name)
    end
end
