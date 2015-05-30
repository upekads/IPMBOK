class ProjectDocumentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project_document, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  before_action :get_projectmanager, only: [:show,:assign_create]

  # GET /project_documents
  # GET /project_documents.json
  def index
    @project_documents = ProjectDocument.all
  end

  # GET /project_documents/1
  # GET /project_documents/1.json
  def show

    @document_version = Version.where(project_document_id: params[:id])
    #@document_version = Version.all

    @project_documents = ProjectDocument.new
    @dataFile = DataFile.new

    @outputs=get_outputs(@project_document.pmbok_doc.name)
    @inputs=get_inputs(@project_document.pmbok_doc.name)
    @tasks=Task.where('project_document_id= ? and status= ?',params[:id],  'Open')

  end

  # GET /project_documents/new
  def new
    @project_document = ProjectDocument.new
    @project=Project.find(params[:project_id])

    #@dataFile = DataFile.new
  end

  # GET /project_documents/1/edit
  def edit
  end

  # POST /project_documents
  # POST /project_documents.json
  def create
    @project_document = ProjectDocument.new(project_document_params)

    respond_to do |format|
      if @project_document.save
        format.html { redirect_to projects_path, notice: 'Project document was successfully created.' }
        format.json { render :show, status: :created, location: @project_document }
      else
        format.html { render :new }
        format.json { render json: @project_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_documents/1
  # PATCH/PUT /project_documents/1.json
  def update
    respond_to do |format|
      if @project_document.update(project_document_params)
        format.html { redirect_to @project_document, notice: 'Project document was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_document }
      else
        format.html { render :edit }
        format.json { render json: @project_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_documents/1
  # DELETE /project_documents/1.json
  def destroy
    @project_document.destroy
    respond_to do |format|
      format.html { redirect_to project_documents_url, notice: 'Project document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_create
  @task =Task.new

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_document
      @project_document = ProjectDocument.find(params[:id])
    end

  def set_project
    @project_document = ProjectDocument.find(params[:id])
    @project = Project.find(@project_document.project_id)
  end

  def get_projectmanager
    @project_document = ProjectDocument.find(params[:id])
    @project = Project.find(@project_document.project_id)
    @project_manager =@project.project_teams.find_by_project_role_id("1")
    @project_manager_user=@project.project_teams.where("project_role_id =?", 1).pluck(:user_id)
    @project_current_team=@project.project_teams.all.pluck(:user_id)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_document_params
      params.require(:project_document).permit(:pmbok_doc_id, :project_id, :docname, :status)
    end
end
