class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :update, :show]

  
  def index
    @diaries = Diary.where(user_id: current_user.id).date_sort
    @day = @diaries.first
  end

  def show
    @diaries = Diary.where(user_id: @user.id).date_sort
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
    params.require(:user).permit(:name, :email, :goal)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
