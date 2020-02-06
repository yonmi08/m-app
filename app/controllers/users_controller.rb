class UsersController < ApplicationController
  before_action :set_user
  before_action :set_diary, only: [:index, :show]
  before_action :set_group, only: [:index, :show, :destroy]
  before_action :action_json, only: [:index, :show]
  
  def index
  end

  def show

  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    @user.groups.delete_all
    if @group.users.blank?
      @group.flag = 0
      @group.save
    end
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :goal)
  end


  def set_user
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def set_diary
    @diaries = Diary.where(user_id: @user.id).date_sort
    @day = @diaries.first
  end

  def set_group
    @group = @user.groups.first
  end

  def action_json
    respond_to do |format|
      format.html #show.html.haml
      format.xml { render :xml => @diaries }
      format.json { render :json => @diaries}
    end
  end
end
