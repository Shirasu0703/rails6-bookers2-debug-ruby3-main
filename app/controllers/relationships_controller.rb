class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end


  # フォローしているユーザー一覧を表示
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end


  #フォロワー一覧を表示
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end


end
