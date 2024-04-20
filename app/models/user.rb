class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :articles

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validate :password_complexity

  private
  def password_complexity
    if password.present? && !password.match(/(?=.*[A-Z])(?=.*\d)/)
      errors.add :password, 'Your password must include at least one uppercase letter and one digit'
    end
  end

  before_destroy :set_articles_to_inactive_user

  private

  def set_articles_to_inactive_user
    inactive_user = User.find_by(email: "inactive@user.com")
    self.articles.update_all(user_id: inactive_user.id)
  end

end
