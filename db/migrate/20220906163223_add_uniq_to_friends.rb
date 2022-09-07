class AddUniqToFriends < ActiveRecord::Migration[7.0]
  def change
    add_index :friends, [:user_id, :friend_id], unique: true
  end
end
