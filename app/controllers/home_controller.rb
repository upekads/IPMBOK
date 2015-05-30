class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
    @tasks = Task.where("assigned_id = ? and status = ?", session[:user_id], 'Open')
  end

  def manage_user
    @users = User.where("id <> ?", current_user.id).order("id")
  end

end
