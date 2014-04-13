class DeliveryFilesController < ApplicationController
  before_action :set_delivery_file, only: [:show, :edit, :update, :destroy]

  # GET /delivery_files
  # GET /delivery_files.json
  def index
    @delivery_files = DeliveryFile.all
  end

  # GET /delivery_files/1
  # GET /delivery_files/1.json
  def show
  end

  # GET /delivery_files/new
  def new
    @delivery_file = DeliveryFile.new
  end

  # GET /delivery_files/1/edit
  def edit
  end

  # POST /delivery_files
  # POST /delivery_files.json
  def create
    @delivery_file = DeliveryFile.new(delivery_file_params)

    respond_to do |format|
      if @delivery_file.save
        format.html { redirect_to @delivery_file, notice: 'Delivery file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @delivery_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @delivery_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_files/1
  # PATCH/PUT /delivery_files/1.json
  def update
    respond_to do |format|
      if @delivery_file.update(delivery_file_params)
        format.html { redirect_to @delivery_file, notice: 'Delivery file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @delivery_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_files/1
  # DELETE /delivery_files/1.json
  def destroy
    @delivery_file.destroy
    respond_to do |format|
      format.html { redirect_to delivery_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_file
      @delivery_file = DeliveryFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_file_params
      params.require(:delivery_file).permit(:delivery_id, :document_id)
    end
end
