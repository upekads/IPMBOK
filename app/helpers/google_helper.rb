module GoogleHelper

    def login_url
      redirect_uri = ApplicationController::BASEURL + 'oauth2callback'

      url = 'https://accounts.google.com/o/oauth2/auth?' +
          'scope=' + ApplicationController::CLIENT_SCOPE + '&' +
          'redirect_uri=' + redirect_uri + '&' +
          'response_type=code&' +
          'client_id=' + ApplicationController::CLIENT_ID + '&' +
          'access_type=offline'

      puts(url.strip)
      URI.parse(URI.encode(url.strip))

    end

    def call_api(path, access_token)

      # Initialize HTTP library
      url = URI.parse('https://www.googleapis.com')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

      # Make request to API
      request = Net::HTTP::Get.new(path)
      request['Authorization'] = 'Bearer ' + access_token
      response = http.request(request)

      JSON.parse(response.body)

    end

=begin
    def call_api_post(path,params, access_token)

      # Initialize HTTP library
      url = URI.parse('https://www.googleapis.com')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

      # Make request for tokens
      request = Net::HTTP::Post.new(path)
      request['Authorization'] = 'Bearer ' + access_token
      request.set_form_data(params)
      response = http.request(request)

      # Parse the response
      Rails.logger.debug('params')
      Rails.logger.debug(params.to_hash)
      result = JSON.parse(response.body)


      return result
    end
=end



    def valid_token?(access_token)

      path = '/oauth2/v1/tokeninfo?id_token=' + access_token

      # Initialize HTTP library
      url = URI.parse('https://www.googleapis.com')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

      # Make request to API
      request = Net::HTTP::Get.new(path)
      #request['id_token'] =  access_token
      response = http.request(request)

      result = JSON.parse(response.body)

      Rails.logger.debug(access_token)
      Rails.logger.debug('Result for check valid token')
      Rails.logger.debug(result.to_hash)
      if(result['error'] != nil && result['error'] == 'invalid_token')
        false
      else
        true
      end

    end

    def refresh_token(user_id)

      user = User.find(user_id)

      params = Hash.new

      params['refresh_token'] = user.refresh_token
      params['client_id'] = ApplicationController::CLIENT_ID
      params['client_secret'] = ApplicationController::CLIENT_SECRET
      params['grant_type'] = 'refresh_token'



      # Initialize HTTP library
      url = URI.parse('https://www.googleapis.com')
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

      # Make request for tokens
      request = Net::HTTP::Post.new('/oauth2/v3/token')
      request.set_form_data(params)
      response = http.request(request)

      # Parse the response
      user_tokens = JSON.parse(response.body)

      # Save the new access_token to the user
      user.access_token = user_tokens['access_token']
      user.expires = user_tokens['expires_in']
      user.save

      # Return the new access_token
      user_tokens['access_token']

    end

  def checkAndGetNewToken(access_token,projectMangerId)
    if (!(valid_token?(access_token))) #### access_token for Project manager

      Rails.logger.debug('Log : Start renew token')

      newAccessToken = refresh_token(projectMangerId) #### user_id for Project manager

      return newAccessToken
     # client.authorization.access_token = newAccessToken
      # session[:access_token] = newAccessToken
    else
        return access_token
    end
  end

  end