class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre
  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'rails_image.png'
  end
end
