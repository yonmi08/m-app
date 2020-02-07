class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :join]
  before_action :set_event, only: [:edit, :update]

  def new
    @group = Group.new
    @group.users << current_user
    @group.build_event
  end

  def create
    @group = Group.create(group_params)
    if @group.save 
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id)
    else
      render :edit
    end
  end

  def join
    @group.users << current_user
    @group.save
    redirect_to group_messages_path(@group.id)
  end

  private
  def group_params
    params.require(:group).permit(:name, :genre, :border, :flag,
      event_attributes: [:id, :pass_text, :pass_url, :fail_text, :fail_url, :group_id]
    )
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def set_event
    @group.build_event unless @group.event
  end
end