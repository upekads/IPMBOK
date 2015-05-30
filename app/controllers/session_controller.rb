class SessionController < ApplicationController

  def new
    # Redirect to the Google URL

    ##Rails.logger.debug('Pop:' + GoogleHelper.login_url.to_s)

   redirect_to GoogleHelper.login_url.to_s
  end

  def create

    Rails.logger.debug('Start to update or crate user detail from google')
    # Get user tokens from GoogleHelper
    user_tokens = get_tokens(params[:code])

    Rails.logger.debug('User token:' + user_tokens.to_yaml)

    # Get the username from Google
    user_info = GoogleHelper.call_api('/oauth2/v2/userinfo', user_tokens['access_token'])

    user = User.where(:uid => user_info['id']).first

    # Create the user if they don't exist
    if(user == nil)

      Rails.logger.debug('Try to create user:')
      Rails.logger.debug( user_info)

      user = User.create(:email => user_info['email'],
                         :firstname => user_info['given_name'],
                         :lastname => user_info['family_name'],
                         :role_id => 2 , ######3 wait to keep role_id
                         :uid => user_info['id'],
                         :refresh_token => user_tokens['refresh_token'],
                         :access_token => user_tokens['access_token'],
                         :expires => user_tokens['expires_in'],

                         ### Put to fill for null :false from schema
                         :encrypted_password => 'ILoveYou',
                         :sign_in_count => 0


                        )

      # Create session detail for each user
      setSession(user,user_tokens)

    else
     # user.refresh_token = user_tokens['refresh_token']
      user.access_token = user_tokens['access_token']
      user.expires = user_tokens['expires']
      user.save



      setSession(user,user_tokens)

    end

    # Redirect home
    redirect_to session[:redirect_to] ||= root_path
    #redirect_to  root_path

  end

  def get_tokens(code)

    params['code'] = code
    params['client_id'] = ApplicationController::CLIENT_ID
    params['client_secret'] = ApplicationController::CLIENT_SECRET
    params['redirect_uri'] = ApplicationController::BASEURL + 'oauth2callback'
    params['grant_type'] = 'authorization_code'


    # Initialize HTTP library
    url = URI.parse('https://www.googleapis.com')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

    # Make request for tokens
    request = Net::HTTP::Post.new('/oauth2/v3/token')
    request.set_form_data(params)
    response = http.request(request)

    JSON.parse(response.body)

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  def setSession(user,user_tokens)
    session[:user_id] = user.id
    session[:access_token] = user_tokens['access_token']
   # session[:refresh_token] = user_tokens['refresh_token']
    #session[:expires_in] = user_tokens['expires_in']
  end



end
