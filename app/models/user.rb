class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea
  has_many :joineds, dependent: :destroy
  has_many :joined_ideas, through: :joineds, source: :idea

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name_display
    email
  end
end
