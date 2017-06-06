class FollowingController < ApplicationController
  def index
    @following = Follow.where(user_id: current_user.id).where(unfollow: nil) if current_user
  end
end
