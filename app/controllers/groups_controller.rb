class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    # if @group.save # とりあえず、まだ条件分岐をつけずに単純化させています
    #   redirect_to root_path, notice: 'グループを作成しました'
    # else
    #   render :new
    # end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)

  end
  
  def destroy
  end

  private
  def group_params
    params.require(:group).permit(:name, :genre, :border, :flag, user_ides: []) # usersは後からも入るため空で設定
  end

end
