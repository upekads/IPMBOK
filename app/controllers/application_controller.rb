
include GoogleHelper
include GoogleClientHelper
include SessionHelper
include ProjectsHelper
include PmbokDocOutputsHelper
include PmbokDocInputsHelper
include TasksHelper
require 'uri'
require 'net/http'
require 'net/https'



class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  @@flagTest = false #for testing

  # Pop comment to disable devise
   # before_filter :update_sanitized_params, if: :devise_controller?

  helper_method  :isUserSigned?, :current_user, :authenticate_user!, :setSessionUserId

  def current_user
    if @@flagTest
      @current_user = User.find(1)
    else
      @current_user ||= User.find(session[:user_id])
    end
  end

  def isUserSigned?
    if session[:user_id] == nil
      false
    else
      true
    end
  end

  def setSessionUserId(value)
    session[:user_id] = value
  end

  def authenticate_user!
    unless isUserSigned?
      if @@flagTest
        session[:user_id] = 1
      else
        redirect_to GoogleHelper.login_url.to_s
      end
    end
  end



  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :firstname, :lastname, :role_id)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :firstname, :lastname, :role_id, :password_confirmation, :current_password)}
  end

  BASEURL = 'http://localhost:3000/'
  CLIENT_ID = '63522870110-simqf8dqnrgpnamm127k35e6hpabaei8.apps.googleusercontent.com'
  CLIENT_SECRET = 'ps6sYhOJ73RwBG2CsssTWoh8'
  CLIENT_SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive'
  #CLIENT_SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive.appfolder'

  ROOT_Folder = 'IPMBoK_APP'
  APP_NAME = 'IPMBoK'

  Project_Management_Plan  = '4.2.Project Management Plan'
  Activity_Resource_Requirements = '6.4.Activity Resource Requirements'
  Change_Requests =   '4.5.Change Requests'
  Work_Performance_Reports =  '4.4.Work Performance Reports'
  Issue_Log = '13.3.Issue Log'

  Human_Resources_Management_Plan =  '9.1.Human Resources Management Plan'
  Project_Staff_Assignments = '9.2.Project Staff Assignments'
  Resource_Calendars =  '9.2.Resource Calendars'
  Team_Performance_Assessments =   '9.3.Team Performance Assessments'


  ###

end
