class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :messages

  ##...Avatar Attachment...##
  has_one_attached :avatar

  ## Validations
  validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
             file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
end
