class MessagesController < ApplicationController
  before_action :set_group # 呼び出すことで、messageコントローラの全てのアクションで@groupを利用できるようになるよ

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @event = @group.event
    @group_users = @group.users

    gon.user_name = []
    gon.user_point = []
    @group_users.each do |group_user|
      gon.user_point << group_user.diaries.average(:point).round(1)
      gon.user_name << group_user.name
    end
  end


  def point
    @diaries = Diary.where(user_id: @user.id)
    gon.data = @diaries.average(:point).round(1)
  end


  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flas.now[:alert] = 'メッセージを入力してください'
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
