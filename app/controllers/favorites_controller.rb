class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id).where(remove: nil) if current_user
  end
end
