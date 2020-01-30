class Groups::SearchesController < ApplicationController
  def index
    @groups = Group.where("genre", params[:genre]).pluck(:genre)
  end
end

def index
  @tweets = Tweet.search(params[:keyword])
end

