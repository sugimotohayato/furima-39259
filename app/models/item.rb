class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :state
  belongs_to :shipping

  validates :name, presence: true
  validates :data, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,
      presence: true,
      length: { 3, 7 , message: "is out of setting range"},
      format: { with: /\A[\d]+\z/ , message: "is invalid. Input half-width characters"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true

end
