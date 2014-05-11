class Api::V1::DocumentsController < Api::V1::BaseController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_documents

  def index 
    respond_with(@documents)
  end

  def download
    document = @documents.find(params[:id])
    send_file(document.file.path, type: document.file_content_type)
  end

  def show
    document = @documents.find(params[:id])
    respond_with(document)
  end

  private

    def set_user
      @user = current_user.student? ? current_user.student : current_user.teacher
    end

    def set_documents
      @documents = if(params[:delivery_id])
        @user.deliveries.find(params[:delivery_id]).documents
      else
        @user.documents
      end
    end
end