class UploadController < ApplicationController
  def new

    if session[:user_id] == nil
      Rails.logger.debug('Log : Not login user')
      redirect_to GoogleHelper.login_url.to_s

    else

      Rails.logger.debug('Log : Start upload')

      # Rails.logger.debug('Project id :')
      #Rails.logger.debug(params[:project_id])

      client = Google::APIClient.new

      # put the tokens in the session to client
      #Set Token for Project Manager
      projectManagerAccessToken = params[:projectManagerAccessToken]
      projectManagerId= params[:projectManagerId]

      #### access_token for Project manager
      #### user_id for Project manager
      client.authorization.access_token = GoogleHelper.checkAndGetNewToken(projectManagerAccessToken, projectManagerId)


      #Crete folder Root and Project folder
      createAllFolder(client)

      redirect_to project_project_document_path(params[:project_id], params[:document_id])

    end
  end

  def createAllFolder(client)

    Rails.logger.debug('Log : Start crate folder')

    # Find root folder // Maybe after create save root it to our database
    rootFolderId = isFolderExit(client, 'root', ApplicationController::ROOT_Folder)

    #  Rails.logger.debug('Log : Root folder id : ' + "#{rootFolderId}")
    # check Root folder
    if rootFolderId.to_s == ''

      Rails.logger.debug('Log : Start crate root folder')
      title = ApplicationController::ROOT_Folder
      parent_id = 'root'

      result = GoogleClientHelper.createFolder(client, title, parent_id, 'Root folder fo IPMBoK application')

      # Set Root id after create
      rootFolderId = result['id']
      #Rails.logger.debug('Log : After crate root folder')
      #Rails.logger.debug(result.to_hash)

      createProjectFolder(client, rootFolderId, params[:project_id], params[:document_id])

    else

      createProjectFolder(client, rootFolderId, params[:project_id], params[:document_id])

    end

  end


  def createProjectFolder(client, rootFolderId, project_id, document_id)
    #Create Folder project
    Rails.logger.debug('Log : Start crate Project folder')

    projectFolderName = "#{project_id}_#{ApplicationController::APP_NAME}"
    projectFolderId = isFolderExit(client, rootFolderId, projectFolderName)
    # check Project folder
    if projectFolderId.to_s == ''
      title = projectFolderName
      parent_id = rootFolderId

      result = GoogleClientHelper.createFolder(client, title, parent_id, 'Project folder for IPMBoK')


      # Set project id after create
      projectFolderId = result['id']

      #Rails.logger.debug('Log : After crate project folder')
      #Rails.logger.debug(result.to_hash)

      #Create document
      title = params[:file_name]
      description = ''
      parent_id = projectFolderId
      mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
      file_name = params[:path_file]

      createFile(client, title, description, mime_type, parent_id, file_name, document_id)

    else

      title = params[:file_name]
      description = ''
      parent_id = projectFolderId
      mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
      file_name = params[:path_file]

      createFile(client, title, description, mime_type, parent_id, file_name, document_id)

    end
  end

  def createFile(client, title, description, mime_type, parent_id, file_name, document_id)

    Rails.logger.debug('Log : Start to create file')

    result = GoogleClientHelper.insert_file(client, title, description, parent_id, mime_type, file_name)

    # Pretty print the API result
    if result != nil

      # use response detail

      Rails.logger.debug("Result after upload:#{result.to_hash}")

      # Save new document version

      @document = ProjectDocument.find(document_id)

      if (@document.last_version != nil)

        @document.versions.create(:docname => @document.getFileNameWithLastVersion, :document_gid => @document.document_gid, :user_id => @document.user_id)

      end
      # Save document_gid

      @document.document_gid = result['id']
      @document.last_version = @document.last_version.nil? ? "1" : (@document.last_version.to_int + 1)
      @document.user_id = session[:user_id]
      @document.save

      #For set status of task to 'File uploaded'


      @task = TasksHelper.getTaskID(session[:user_id],document_id )

      @task.status = 'File uploaded'
      @task.save

      #For setting the status of project document to 'Pending to check'
      @document.status = 'Pending to check'
      @document.save

    end

  end

  def getFile

    @projectManager = ProjectsHelper.findProjectManagerById(params[:project_id])
    client = Google::APIClient.new
    client.authorization.access_token = @projectManager.access_token

    #### access_token for Project manager
    #### user_id for Project manager
    client.authorization.access_token = GoogleHelper.checkAndGetNewToken(@projectManager.access_token, @projectManager.id)

    file = GoogleClientHelper.print_file(client, params[:document_gid])

    if file != nil

      @project_document = ProjectDocument.find_by_document_gid(params[:document_gid])


      respond_to do |format|
        format.html { send_data GoogleClientHelper.download_file(client, file), :disposition => 'downloaded', :filename => "#{@project_document.getFileNameWithLastVersion}.#{file['title'].split('.',2).last}" }
      end


    else
      redirect_to root_path
    end
  end

  def getFileHistory

    @projectManager = ProjectsHelper.findProjectManagerById(params[:project_id])
    client = Google::APIClient.new
    client.authorization.access_token = @projectManager.access_token

    #### access_token for Project manager
    #### user_id for Project manager
    client.authorization.access_token = GoogleHelper.checkAndGetNewToken(@projectManager.access_token, @projectManager.id)

    file = GoogleClientHelper.print_file(client, params[:document_gid])

    if file != nil

      @document_version = Version.find(params[:version_id])

        respond_to do |format|
          format.html { send_data GoogleClientHelper.download_file(client, file), :disposition => 'downloaded', :filename => "#{@document_version.docname}.#{file['title'].split('.',2).last}" }
        end


    else
      redirect_to root_path
    end
  end

end
