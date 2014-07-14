class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:add_input, :add_output]
  before_filter :initialize_test_documents

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  def add_input
    file = params[:input]
    @@test_input = Document.new name: file.original_filename, file:file
    render nothing:true
  end

  def add_output
    file = params[:output]
    @@test_output = Document.new name: file.original_filename, file:file
    render nothing:true
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.phase_id = test_params[:phase_id]
    @test.input = @@test_input
    @test.output = @@test_output
    respond_to do |format|
      if @test.save
        format.html { redirect_to phase_tests_path(@test.phase), notice: 'Teste criado com sucesso' }
        format.json { render action: 'show', status: :created, location: @test }
      else

        error = if !@test.input
          "Porfavor carregue ficheiros de input."
        elsif !@test.output
          "Porfavor carregue ficheiros de output."
        else
          "Erro ao criar nova entrega, verifique todos os campos."
        end


        format.html { redirect_to phase_tests_path(@test.phase), notice: error }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    phase = @test.phase
    @test.destroy
    respond_to do |format|
      format.html { redirect_to phase_tests_path(phase) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def initialize_test_documents
      @@test_input ||= nil
      @@test_output ||= nil
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:phase_id, :executable, :name)
    end
end
