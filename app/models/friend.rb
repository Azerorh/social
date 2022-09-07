class Friend < ApplicationRecord
  validates :user_id, uniqueness: { scope: :friend_id }
end
