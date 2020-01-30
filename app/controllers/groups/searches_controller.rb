class Groups::SearchesController < ApplicationController
  def searche
    @groups = Group.where("genre", params[:genre]).pluck(:genre)
  end
end
