class Deli < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :send_area
  belongs_to :order
end
