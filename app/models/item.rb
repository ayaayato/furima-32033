class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :send_area
  belongs_to :send_fee
  belongs_to :send_day
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :send_area_id
    validates :send_fee_id
    validates :send_day_id
    validates :image
    validates :title
    validates :explan
    validates :price,
               format: {with: /\A[0-9]+\z/},
               numericality: {
                less_than_or_equal_to: 9999999,
                 greater_than_or_equal_to: 300
               }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :send_area_id
    validates :send_fee_id
    validates :send_day_id
  end


end
