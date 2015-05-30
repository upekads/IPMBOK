require 'google/api_client'

module GoogleClientHelper

##
# Create a new file
#
# @param [Google::APIClient] client
#   Authorized client instance
# @param [String] title
#   Title of file to insert, including the extension.
# @param [String] description
#   Description of file to insert
# @param [String] parent_id
#   Parent folder's ID.
# @param [String] mime_type
#   MIME type of file to insert
# @param [String] file_name
#   Name of file to upload
# @return [Google::APIClient::Schema::Drive::V2::File]
#   File if created, nil otherwise
  def insert_file(client, title, description, parent_id, mime_type, file_name)
    #Rails.logger.debug('File name '  + file_name)
    drive = client.discovered_api('drive', 'v2')
    file = drive.files.insert.request_schema.new({
                                                     'title' => title,
                                                     'description' => description,
                                                     'mimeType' => mime_type
                                                 })
    # Set the parent folder.
    if parent_id
      file.parents = [{'id' => parent_id}]
    end
    media = Google::APIClient::UploadIO.new(file_name, mime_type)
    result = client.execute(
        :api_method => drive.files.insert,
        :body_object => file,
        :media => media,
        :parameters => {
            'uploadType' => 'multipart',
            'alt' => 'json'})
    if result.status == 200
      return result.data
    else
      Rails.logger.debug("Error : An error occurred: #{result.data['error']['message']}")
      return nil
    end
  end


  def isFolderExit(client, parents_id, titleName)

    Rails.logger.debug("Start find by : #{titleName}")

    drive = client.discovered_api('drive', 'v2')
    page_token = nil
    begin
      parameters = {'folderId' => parents_id, 'q' => "title='#{titleName}' and mimeType='application/vnd.google-apps.folder'"}
      if page_token.to_s != ''
        parameters['pageToken'] = page_token
      end
      result = client.execute(
          :api_method => drive.children.list,
          :parameters => parameters)

      if result.status == 200
        children = result.data
        Rails.logger.debug("children data: #{result.data.to_hash}")
        if children.items.count != 0
          children.items.each do |child|

            Rails.logger.debug("File Id: #{child.id}")
            return child.id

            #children.items[0].id

          end

        else
          return nil
        end

      else
        Rails.logger.debug("An error occurred: #{result.data['error']['message']}")
        page_token = nil
      end
    end while page_token.to_s != ''

  end

  def createFolder(client, title, parents_id,description)

    mime_type = 'application/vnd.google-apps.folder'

    drive = client.discovered_api('drive', 'v2')
    file = drive.files.insert.request_schema.new({
                                                     'title' => title,
                                                     'description' => description,
                                                     'mimeType' => mime_type,
                                                     'parents' => [{'id' => parents_id}]
                                                 })


    result = client.execute(
        :api_method => drive.files.insert,
        :body_object => file)

    if result.status == 200
      return result.data

    else
      Rails.logger.debug("Error : An error occurred: #{result.data.to_hash}")
      Rails.logger.debug("Error : An error occurred: #{result.data['error']['message']}")
      return nil
    end

  end

  ##
  # Print a file's metadata.
  #
  # @param [Google::APIClient] client
  #   Authorized client instance
  # @param [String] file_id
  #   ID of file to print
  # @return nil
  def print_file(client, file_id)
    drive = client.discovered_api('drive', 'v2')
    result = client.execute(
        :api_method => drive.files.get,
        :parameters => { 'fileId' => file_id })
    if result.status == 200
       result.data # file object
    else
      puts "An error occurred: #{result.data['error']['message']}"
    end
  end

  ##
  # Download a file's content
  #
  # @param [Google::APIClient] client
  #   Authorized client instance
  # @param [Google::APIClient::Schema::Drive::V2::File]
  #   Drive File instance
  # @return
  #   File's content if successful, nil otherwise
  def download_file(client, file)
    if file.download_url
      result = client.execute(:uri => file.download_url)
      if result.status == 200
        return result.body
      else
        puts "An error occurred: #{result.data['error']['message']}"
        return nil
      end
    else
      # The file doesn't have any content stored on Drive.
      return nil
    end
  end

end