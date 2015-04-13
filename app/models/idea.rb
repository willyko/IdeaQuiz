class Idea < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :joineds, dependent: :destroy
  has_many :joined_users, through: :joineds, source: :user
end
