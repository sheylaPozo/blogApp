class User < ApplicationRecord
  after_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than: 0, allow_nil: true }

  def recent_posts
    posts.last(3)
  end

  private

  def set_default_role
    update(role: 'user')
  end
end
