class DiariesController < ApplicationController
  before_action :set_diary, only: [:edit, :update, :show, :destroy]
  before_action :set_user, only: [:edit, :update, :show, :new, :create]

  def index
    @diaries = Diary.includes(:user).all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.title = "#{@diary.point}点"
    if @diary.save
      @diary.url = "/users/#{@diary.user_id}/diaries/#{@diary.id}"
      @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @diary.update(diary_params)
      @diary.title = "#{@diary.point}点"
      @diary.url = "/users/#{@diary.user_id}/diaries/#{@diary.id}"
      @diary.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to root_path
  end

  def show

  end

  private
  def diary_params
    params.require(:diary).permit(:text, :point, :date, :title, :url).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_diary
    @diary = Diary.find(params[:id]) 
  end
end
