class VersionController < ApplicationController
  def new
  end

  def index

    @document_version = Version.where(project_document_id: params[:document_id])
   # @document_version = Version.all
  end

  def recovery
    @document = ProjectDocument.find(params[:document_id])
    @document_version = Version.find(params[:version_id])

    if (@document.last_version != nil && @document_version != nil)

      @document.versions.create(:docname => @document.getFileNameWithLastVersion, :document_gid => @document.document_gid, :user_id => @document.user_id)

      # Save document_gid

      if(@document_version != nil)
        Rails.logger.debug("Log : Update version")
        Rails.logger.debug(@document.last_version.to_int + 1)
        @document.document_gid = @document_version.document_gid
        @document.last_version = @document.last_version.nil? ? "1" : (@document.last_version.to_int + 1)
        @document.user_id = session[:user_id]
        @document.save
      end
    end

    redirect_to project_project_document_path(params[:project_id], params[:document_id])


  end
end
