class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :sebd_area
  belongs_to :send_fee
  belongs_to :send_day
  has_one_attached :image

  validates :genre_id, numericality: { other_than: 1 }
end
