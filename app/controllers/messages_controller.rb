class MessagesController < ApplicationController
  before_action :set_group # 呼び出すことで、messageコントローラの全てのアクションで@groupを利用できるようになるよ

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    @group_users = @group.users
    @diary = @group_users.diaries
    binding pry
  end

  def create
    @messages = @group.messages.new(message_params)
    if @messages.save
      redirect_to group_messages_path(@group)
    else
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
