class MessagesController < ApplicationController
  include PointHelper
  include DateHelper
  include MessagesHelper
  
  before_action :set_group # 呼び出すことで、messageコントローラの全てのアクションで@groupを利用できるようになるよ

  def index
    @progress, @group_limit = date_calc(@group.created_at)

    @message = Message.new
    @messages = @group.messages.includes(:user)
    @group_users = @group.users

    gon.user_name, gon.user_point = users_average(@group_users)
    @group_average = group_average(gon.user_point).round(1)

    @event = @group.event
    if @event.present?
      @doc_pass, @pass_url = set_ogp(@event.pass_url) if @event.pass_url.present?
      @doc_fail, @fail_url = set_ogp(@event.fail_url) if @event.fail_url.present?
    else
      @event = false
    end
  end

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
