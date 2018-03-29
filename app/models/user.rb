class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments,
                             source: :commentable,
                             source_type: :Post

  has_many :commented_users, through: :comments,
                             source: :commentable,
                             source_type: :User
  before_destroy :log_before_destroy
  after_destroy  :log_after_destroy

  after_create :welcome_email

  private

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def log_before_destroy
    Rails.logger.info "User #{@name} will be destroyed"
  end

  def log_after_destroy
    Rails.logger.info "User #{@name} was destroyed!"
  end
end
