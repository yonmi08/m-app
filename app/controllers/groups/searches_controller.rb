class Groups::SearchesController < ApplicationController
  def index
    @groups = Group.search(params[:keyword], params[:genre])
  end
end
