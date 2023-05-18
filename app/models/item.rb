class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :data, presence: true
  validates :category_id, presence: true
  validates :price, presence:
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :state_id, presence: true
  validates :shipping_id, presence: true
  validates :user, presence: true
  validates :image, presence: true

end
