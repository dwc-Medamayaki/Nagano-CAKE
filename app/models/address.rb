class Address < ApplicationRecord
  belongs_to :customer
  
  with_options presence: true do
   validates :post_code, numericality: {only_integer: true}
   validates :location
   validates :name
  end
  
  def view_postcode_and_address_and_name
    "〒 " + self.post_code + " " + self.location + " " + self.customer.full_name
  end
  
end
