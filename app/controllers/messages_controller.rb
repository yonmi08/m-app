class MessagesController < ApplicationController
  before_action :set_group # 呼び出すことで、messageコントローラの全てのアクションで@groupを利用できるようになるよ

  def index
    @progress = Date.today - @group.created_at.to_date

    @message = Message.new
    @messages = @group.messages.includes(:user)
    @event = @group.event
    @group_users = @group.users

    gon.user_name = []
    gon.user_point = []
    @group_points = 0
    total = 0

    @group_users.each do |group_user|
      diaries = group_user.diaries.where("date >= ? and date <= ?", @group.created_at.to_date, @group.created_at.to_date + 7)
      points = diaries.average(:point)
      if points.present?
        gon.user_point << points
        gon.user_name << group_user.name
        total += points
      end
    end
    @group_points = total / gon.user_name.length unless total == 0
  end


  # def point
  #   @diaries = Diary.where(user_id: @user.id)
  #   gon.data = @diaries.average(:point).round(1)
  # end


  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
