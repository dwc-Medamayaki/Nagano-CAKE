class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre
  has_one_attached :image

  with_options presence: true do
    validates :item_genre_id
    validates :item_name
    validates :item_detail
    validates :price
    validates :status
  end

  def get_image
    (image.attached?) ? image : 'rails_image.png'
  end

  def tax_price
    (self.price * 1.10).round
  end
end
