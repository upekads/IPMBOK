class SubprocessGroupsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_subprocess_group, only: [:show, :edit, :update, :destroy]

  # GET /subprocess_groups
  # GET /subprocess_groups.json
  def index
    @subprocess_groups = SubprocessGroup.all
  end

  # GET /subprocess_groups/1
  # GET /subprocess_groups/1.json
  def show
  end

  # GET /subprocess_groups/new
  def new
    @subprocess_group = SubprocessGroup.new
  end

  # GET /subprocess_groups/1/edit
  def edit
  end

  # POST /subprocess_groups
  # POST /subprocess_groups.json
  def create
    @subprocess_group = SubprocessGroup.new(subprocess_group_params)

    respond_to do |format|
      if @subprocess_group.save
        format.html { redirect_to @subprocess_group, notice: 'Subprocess group was successfully created.' }
        format.json { render :show, status: :created, location: @subprocess_group }
      else
        format.html { render :new }
        format.json { render json: @subprocess_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subprocess_groups/1
  # PATCH/PUT /subprocess_groups/1.json
  def update
    respond_to do |format|
      if @subprocess_group.update(subprocess_group_params)
        format.html { redirect_to @subprocess_group, notice: 'Subprocess group was successfully updated.' }
        format.json { render :show, status: :ok, location: @subprocess_group }
      else
        format.html { render :edit }
        format.json { render json: @subprocess_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subprocess_groups/1
  # DELETE /subprocess_groups/1.json
  def destroy
    @subprocess_group.destroy
    respond_to do |format|
      format.html { redirect_to subprocess_groups_url, notice: 'Subprocess group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subprocess_group
      @subprocess_group = SubprocessGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subprocess_group_params
      params.require(:subprocess_group).permit(:name, :code, :process_group_id, :knowledge_area_id)
    end
end
