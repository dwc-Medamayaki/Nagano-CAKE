class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  enum status: { waiting: 0, confirm: 1, cooking: 2, preparing: 3, derlivered: 4 }
  enum pay_method: { credit_card: 0, transfar: 1 }
end
