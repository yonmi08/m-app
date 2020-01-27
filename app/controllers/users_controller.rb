class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :update, :show]
  before_action :set_group, only: [:edit, :destroy, :update]

  
  def index
    @group = Group.find(current_user.group_id)
    @diaries = Diary.where(user_id: current_user.id).order(date: :desc)
    @day = @diaries.first
  end

  def show
    @diaries = Diary.where(user_id: @user.id).order(date: :desc)
    @day = @diaries.first
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
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :goal).merge(group_id: @group.id)
  end

  def set_group
    @group = Group.find(@user.group_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
