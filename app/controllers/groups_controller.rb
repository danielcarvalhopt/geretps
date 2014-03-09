class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :add_members]
  before_action :set_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    respond_json(@groups)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    respond_json(@group)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save

        Member.create student_id: @user.id, group_id: @group.id

        format.html {
          flash[:notice] = 'Grupo criado com sucesso.'
          redirect_to project_groups_path @group.project
        }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html {
          error = if @group.identifier.blank?
            'Porfavor preencha o identificador do grupo.'
          else
            'Porfavor escolha um identificador ainda não utilizado.'
          end

          flash[:error] = error
          redirect_to project_groups_path @group.project
        }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def add_members
    new_members_ids = params[:group][:members]

    if new_members_ids.count <= 1
      flash[:error] = 'Nenhum elemento selecionado.'
      return redirect_to project_groups_path @group.project
    end

    if @group.students.count + new_members_ids.count-1 >  @group.project.max_elems
      flash[:error] = "Não é possível adicionar os elementos selecionados, os grupos devem ser constituídos por um máximo de #{@group.project.max_elems} elementos."
      return redirect_to project_groups_path @group.project
    end

    new_members_ids.each do |new_id|
      if !new_id.blank?
        member = Member.new student_id: new_id, group_id: @group.id
        if !member.save!
          flash[:error] = 'Erro ao adicionar um elemento.'
          return redirect_to project_groups_path @group.project
        end
      end
    end

    respond_to do |format|
      format.html {
        flash[:notice] = 'Elementos adicionados com sucesso.'
        redirect_to project_groups_path @group.project
      }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:identifier, :project_id)
    end
end
