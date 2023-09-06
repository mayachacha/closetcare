class Dress < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :size
  has_many_attached :images
  has_many :mylists,  dependent: :destroy
  belongs_to :user

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999 }
  validates :images, length: { minimum: 1, maximum: 3 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :size

  def mylisted_by?(user)
    mylists.where(user_id: user.id).exists?
  end
end
