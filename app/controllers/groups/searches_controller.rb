class Groups::SearchesController < ApplicationController
  def index
    @groups = Group.search(params[:name])
    redirect_to action: :index
  end
end