class Dress < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :size
  has_many_attached :images
  has_one :mylist , dependent: :destroy

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank" }, presence: true
  validates :size_id, numericality: { other_than: 1 , message: "can't be blank" }, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999 }, allow_blank: true # 空白を許可
  validates :images, length: { minimum: 1, maximum: 3 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :size
end
