class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
    # @group.build_event
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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :genre, :border, :flag, user_ids: [],
      event_attributes: [:id, :pass_text, :pass_url, :fail_text, :fail_url, :group_id]
    )
  end
end