class DiariesController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :show]
  before_action :set_diary, only: [:edit, :update, :show]

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @diary.update(diary_params)
      redirect_to root_path
    else
      render :edit, alert: '正しく入力をしてください。'
    end
  end

  def destroy
    
  end

  def show

  end

  private
  def diary_params
    params.require(:diary).permit(:text, :point, :date).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_diary
    @diary = Diary.find(params[:id]) 
  end
end
