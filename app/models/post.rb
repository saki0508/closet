class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :title, :text, presence: true
end
