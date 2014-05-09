# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  friend_id  :integer
#  owner_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Friendship < ActiveRecord::Base
  belongs_to :friend, class_name: 'User', foreign_key: :friend_id
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates_uniqueness_of :friend_id, scope: [:owner_id]

  def self.can_friend?(friend_id, owner_id)
    return false if friend_id == owner_id
    return false if Friendship.exists?( owner_id: owner_id, friend_id: friend_id)
    true
  end
end
