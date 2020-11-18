class Order < ApplicationRecord

 belongs_to :item
 has_one :deli
 belongs_to :user
 
end
