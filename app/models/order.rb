class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum status: { waiting: 0, confirm: 1, cooking: 2, preparing: 3, derlivered: 4 }
  enum pay_method: { credit_card: 0, transfar: 1 }
  
  def view_postcode_and_address_and_name
    "〒 " + self.send_post_code + " " + self.send_address + " " + self.send_name
  end
  
  def total_pay
    total_payment+postage
  end 
  
  def item_total_price(order_items)
    price*quantity
  end
  
  
  
end
