class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_project_team_list, only: [:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy, :new_manager, :manage_team, :manage_document,:project_team]
  before_action :get_projectroles
  before_action :get_projectmanager, only: [:show, :edit, :destroy, :new_manager, :manage_team, :manage_document,:project_team]
  before_action :get_currentuser
  before_action :project_team, only: [:show, :edit, :destroy, :manage_team]

  # GET /projects
  # GET /projects.json
  def index
    # @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_teams = @project.project_teams
    @project_documents = @project.project_documents
    @ARR=@project.project_documents.where('docname ILIKE ? ', "%Activity Resource Requirements%").first
    @HRMP=@project.project_documents.where('docname ILIKE ? ', "%Human Resources Management Plan%").first
    @PSA=@project.project_documents.where('docname ILIKE ? ', "%Project Staff Assignments%").first
    @PMP=@project.project_documents.where('docname ILIKE ? ', "%Project Management Plan%").first
    @RCAL=@project.project_documents.where('docname ILIKE ? ', "%Resource Calendars%").first
    @TPA=@project.project_documents.where('docname ILIKE ? ', "%Team Performance Assessments%").first
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project_manager_role =ProjectRole.first


  end

  # GET /projects/1/edit
  def edit

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    @s = project_params[:start_date]
    @e = project_params[:end_date]

    respond_to do |format|
      if @project.save
        @pmbok_docs =PmbokDoc.all
        @pmbok_docs.each do |pmbok_doc|
          @doc_name=@project.projectcode+'_'+pmbok_doc.name
          @project.project_documents.create(:project_id => params[:id], :pmbok_doc_id => pmbok_doc.id, :docname => @doc_name, :status =>'pending to initiate')
        end
        #format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.html {redirect_to Project.new}
        #format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_manager

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def manage_team

  end

  def manage_document
    @project_documents = @project.project_documents
    @ARR=@project.project_documents.where('docname ILIKE ? ', "%Activity Resource Requirements%").first
    @HRMP=@project.project_documents.where('docname ILIKE ? ', "%Human Resources Management Plan%").first
    @PSA=@project.project_documents.where('docname ILIKE ? ', "%Project Staff Assignments%").first
    @PMP=@project.project_documents.where('docname ILIKE ? ', "%Project Management Plan%").first
    @RCAL=@project.project_documents.where('docname ILIKE ? ', "%Resource Calendars%").first
    @TPA=@project.project_documents.where('docname ILIKE ? ', "%Team Performance Assessments%").first
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def get_projectroles
    @project_manager_role =ProjectRole.first
    @project_member_role =ProjectRole.second
  end

  def get_projectmanager
    @project_manager =@project.project_teams.find_by_project_role_id("1")
    @project_manager_user=@project.project_teams.where("project_role_id =?", 1).pluck(:user_id)
  end

  def get_project_team_list

    @project_teams=ProjectTeam.where("user_id =?", current_user)


  end

  def get_currentuser
    @user=User.find(current_user.id)
  end

  def project_team
    @project_current_team=@project.project_teams.all.pluck(:user_id)

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :projectcode, :description, :start_date, :end_date, :status, project_teams_attributes: [:id, :user_id, :project_id, :project_role_id, :_destroy])
  end
end
