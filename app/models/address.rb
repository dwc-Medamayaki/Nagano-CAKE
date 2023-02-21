class Address < ApplicationRecord
  belongs_to :customer
  
  
  def view_postcode_and_address_and_name
    "〒 " + self.post_code + " " + self.location + " " + self.customer.full_name
  end
  
end
