class Groups::SearchesController < ApplicationController
  def indexe
    binding.pry
    @groups = Group.search(params[:genre])
    # genre_ids = Group.where("genre = ?", params[:genre]).pluck(:id)
    # name_ids = Group.where("name LIKE (?)", "#{params[:name]}").pluck(:id)
    # @groups = Group.where("id IN (?) or id IN(?)", genre_ids, name_ids)
  end
end
