class EventsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    diaries = Diary.where(user_id: @user.id).date_sort
    @day = diaries.first
    respond_to do |format|
      format.html #index.html.haml
      format.xml { render :xml => diaries }
      format.json { render :json => diaries}
    end
  end
end
