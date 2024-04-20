class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }

  validates :password_confirmation, presence: true, if: :password_required?

  private
  def password_required?
    password.present? || password_confirmation.present?
  end

end
