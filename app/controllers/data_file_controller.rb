class DataFileController < ApplicationController
  before_filter :authenticate_user!

  def create
    @dataFile = DataFile.create(data_params)

    #Check file
    #check name , size
    # true
    if params[:project_id].to_s != ''

      @projectManager = ProjectsHelper.findProjectManagerById(params[:project_id])

      #Rails.logger.debug('Project manager token' + "#{@projectManager.access_token}")
      #Rails.logger.debug('Project manager id' + "#{@projectManager.id}")

      getFileType(@dataFile.document_content_type)
      #Rails.logger.debug("#{ProjectDocument.find(params[:document_id]).getFileNameWithNewVersion}.#{getFileType(@dataFile.document_content_type)}")


      redirect_to :controller => 'upload',
                  :action => 'new',
                  :project_id => params[:project_id],
                  :document_id => params[:document_id],
                  :path_file => @dataFile.document.path,
                  :file_name => "#{ProjectDocument.find(params[:document_id]).getFileNameWithNewVersion}.#{getFileType(@dataFile.document_content_type)}",
                  :projectManagerAccessToken => @projectManager.access_token,
                  :projectManagerId => @projectManager.id


    else
      redirect_to :back
    end
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def data_params
    params.require(:data_file).permit(:document, :project_id, :document_id)
  end

  def getFileType(applicationType)
    # Rails.logger.debug("Application Type")
    #Rails.logger.debug(applicationType)
    if (applicationType == 'application/msword')
      return 'doc'
    else
      if (applicationType == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')
        return 'docx'
      end
    end
  end
end
