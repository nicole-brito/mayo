class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  acts_as_taggable

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

end
