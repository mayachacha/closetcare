class Dress < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :size
  has_one_attached :imagec

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999 }
  validates :image, presence: true
end
