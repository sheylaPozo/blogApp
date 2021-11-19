class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: { message: 'Name must not be blank' }
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0

  before_validation :trim_text

  def top_most_recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def is?(role)
    self.role == role.to_s
  end

  private

  def trim_text
    self.name = name.strip if name.present?
  end
end
