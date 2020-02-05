class MessagesController < ApplicationController
  before_action :set_group # 呼び出すことで、messageコントローラの全てのアクションで@groupを利用できるようになるよ

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @group_users = @group.users
    @event = @group.event

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
