class ProjetctsController < ApplicationController
  before_action :set_projetct, only: [:show, :edit, :update, :destroy]

  # GET /projetcts
  # GET /projetcts.json
  def index
    @projetcts = Projetct.all
  end

  # GET /projetcts/1
  # GET /projetcts/1.json
  def show
  end

  # GET /projetcts/new
  def new
    @projetct = Projetct.new
  end

  # GET /projetcts/1/edit
  def edit
  end

  # POST /projetcts
  # POST /projetcts.json
  def create
    @projetct = Projetct.new(projetct_params)

    respond_to do |format|
      if @projetct.save
        format.html { redirect_to @projetct, notice: 'Projetct was successfully created.' }
        format.json { render action: 'show', status: :created, location: @projetct }
      else
        format.html { render action: 'new' }
        format.json { render json: @projetct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projetcts/1
  # PATCH/PUT /projetcts/1.json
  def update
    respond_to do |format|
      if @projetct.update(projetct_params)
        format.html { redirect_to @projetct, notice: 'Projetct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @projetct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projetcts/1
  # DELETE /projetcts/1.json
  def destroy
    @projetct.destroy
    respond_to do |format|
      format.html { redirect_to projetcts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projetct
      @projetct = Projetct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projetct_params
      params.require(:projetct).permit(:name, :description, :begin_date, :end_date, :public, :grades, :open, :max_elems, :min_elems, :subject_id, :projects)
    end
end
