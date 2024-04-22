class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_rich_text :body


  acts_as_taggable_on :tags

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :tag_list, presence: true

end
