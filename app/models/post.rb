class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: "post_id", dependent: :destroy
  has_many_attached :images
  validates :title, :text, presence: true
end
