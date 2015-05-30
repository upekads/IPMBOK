class SearchController < ApplicationController
  before_filter :authenticate_user!


  def index
  end

  def search_result

      if params[:status] == 'All'
        @status = ''
      else
        @status = params[:status]
      end

      if params[:start_date] == ''
        @start_date = Date.new(2000,1,1)
      else
        @start_date = params[:start_date]
      end

      if params[:end_date] == ''
        @end_date = Date.new(3000,1,1)
      else
        @end_date = params[:end_date]
      end

      @projects = Project.where('id IN (select project_id from project_teams where user_id = ?) and upper(name) like upper(?) and upper(status) like upper(?) and ((?) between start_date and end_date or (?) between start_date and end_date or start_date between (?) and (?) or end_date between (?) and (?))', "#{session[:user_id]}","%#{params[:name]}%", "%#{@status}%", "#{@start_date}%","#{@end_date}%", "#{@start_date}%","#{@end_date}%","#{@start_date}%","#{@end_date}%")
    end



end
