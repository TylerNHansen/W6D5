class FriendshipsController < ApplicationController
  def create

    @friendship = Friendship.new(friendship_params)
    @friendship.owner = current_user
    @friendship.save!
    head 200
  end

  def destroy
    @friendship = Friendship.find_by(friendship_params)
    @friendship.destroy!
    head 200

  end
  private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :owner_id)
  end
end
