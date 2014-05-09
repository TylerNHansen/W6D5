class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.owner = current_user
    @friendship.save!
    redirect_to users_url
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
