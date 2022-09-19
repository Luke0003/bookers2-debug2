class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    following = Relationship.new
    following.following_id = current_user.id
    following.follower_id = user.id
    following.save
    redirect_to request.referer
  end

  def destroy
    following = Relationship.find_by(following_id: current_user.id, follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
