class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
  end

  # フォローした人一覧に送る（view)アクション　　app/view/users/follows.html.erb
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  # フォローされた人一覧に送る（view)アクション   app/view/users/followers.html.erb
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
