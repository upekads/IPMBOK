class PmbokDocsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_pmbok_doc, only: [:show, :edit, :update, :destroy,:view_templates, :view_workflow]

  # GET /pmbok_docs
  # GET /pmbok_docs.json
  def index
    @pmbok_docs = PmbokDoc.all
  end

  # GET /pmbok_docs/1
  # GET /pmbok_docs/1.json
  def show
  end

  # GET /pmbok_docs/new
  def new
    @pmbok_doc = PmbokDoc.new
  end

  # GET /pmbok_docs/1/edit
  def edit
  end

  # POST /pmbok_docs
  # POST /pmbok_docs.json
  def create
    @pmbok_doc = PmbokDoc.new(pmbok_doc_params)

    respond_to do |format|
      if @pmbok_doc.save
        format.html { redirect_to @pmbok_doc, notice: 'Pmbok doc was successfully created.' }
        format.json { render :show, status: :created, location: @pmbok_doc }
      else
        format.html { render :new }
        format.json { render json: @pmbok_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pmbok_docs/1
  # PATCH/PUT /pmbok_docs/1.json
  def update
    respond_to do |format|
      if @pmbok_doc.update(pmbok_doc_params)
        format.html { redirect_to @pmbok_doc, notice: 'Pmbok doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @pmbok_doc }
      else
        format.html { render :edit }
        format.json { render json: @pmbok_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmbok_docs/1
  # DELETE /pmbok_docs/1.json
  def destroy
    @pmbok_doc.destroy
    respond_to do |format|
      format.html { redirect_to pmbok_docs_url, notice: 'Pmbok doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def view_templates

  end

  def view_workflow
    @outputs=get_outputs(@pmbok_doc.name)
    @inputs=get_inputs(@pmbok_doc.name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pmbok_doc
      @pmbok_doc = PmbokDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pmbok_doc_params
      params.require(:pmbok_doc).permit(:name, templates_attributes: [:id,:pmbok_doc_id,:user_id,:document, :_destroy])
    end
end
