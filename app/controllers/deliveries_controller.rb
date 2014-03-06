class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]
  before_filter :initialize_phase_documents
  skip_before_filter :verify_authenticity_token, :only => [:add_document]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)
    @phase = Phase.find(params[:delivery][:phase_id])

    respond_to do |format|
      if @delivery.save and @@new_phase_documents.count > 0 and check_required_files
        add_delivery_files
        format.html { redirect_to @phase, notice: 'Entrega submetida com sucesso.' }
        format.json { render action: 'show', status: :created, location: @delivery }
      else

        error = if @@new_phase_documents == 0
          "Porfavor carregue ficheiros para a entrega."
        elsif @delivery.description.blank?  
          "Porfavor preencha as informações da entrega."
        elsif !check_required_files
          "Porfavor verifique se a entrega contém todos os ficheiros obrigatórios."
        else
          "Erro ao criar nova entrega, verifique todos os campos."
        end

        format.html { redirect_to @phase, flash: { :error => error }  }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  def add_document
    files = params[:file]
    files.each do |file|
      document = Document.new name:file.original_filename, file:file
      @@new_phase_documents << document
    end
    render nothing:true
  end

  def dowload_files_zip

  end

  private
    def check_required_files
      required_files = @phase.required_files
      required_files.each do |required_file|
        return false if @@new_phase_documents.find{|document| document.name == required_file.name}.nil?
      end
      true
    end

    def initialize_phase_documents
      @@new_phase_documents ||= []
    end

    def add_delivery_files
      @@new_phase_documents.each do |document|
        document.active = true
        document.save! 
        DeliveryFile.create delivery_id: @delivery.id, document_id: document.id
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:description, :public, :evaluated, :phase_id, :group_id)
    end
end
