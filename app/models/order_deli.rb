class OrderDeli
  include ActiveModel::Model

  attr_accessor :postal, :city, :banchi, :bill, :send_area_id, :phone, :item_id, :user_id #:token

  with_options presence: true do
    validates :postal, format: {with: /\d+-\d+/}
    validates :city
    validates :banchi
    validates :phone, length: {maximum: 11}, numericality: true, format: {with: /\A[0-9]+\z/}
    validates :send_area_id, numericality: {other_than: 1}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Deli.create(postal: postal, city: city, phone: phone, banchi: banchi, bill: bill, send_area_id: send_area_id, order_id: order.id)
  end

end