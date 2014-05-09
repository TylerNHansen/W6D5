class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :friend, index: true
      t.references :owner, index: true

      t.timestamps
    end
  end
end
