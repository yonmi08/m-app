class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
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
    @group.update(group_params)

  end
  
  def show
  end

  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :genre, :border, :flag, user_ids: [])
    # ?? params.require(:group).permit(:name, :genre, :border, :flag).merge(user_id: current_user.id)
    # ?? user_idはここでとっちゃって大丈夫？userがグループ作成の時、group_idをとる方？
  end
end