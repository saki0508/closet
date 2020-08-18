class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :image, presence: true
end
