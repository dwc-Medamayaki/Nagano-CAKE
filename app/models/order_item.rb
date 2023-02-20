class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: { cannot_start: 0, wait_cooking: 1, cooking: 2, finished: 3 }
end
