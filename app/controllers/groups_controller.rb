class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :join]
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.create(group_params)
    if @group.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def join
    @group.users << current_user
    @group.save
    redirect_to root_path
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :genre, :border, :flag, user_ids: [],
      event_attributes: [:id, :pass_text, :pass_url, :fail_text, :fail_url, :group_id]
    )
  end

  def set_group
    @group = Group.find(params[:id])
  end
end