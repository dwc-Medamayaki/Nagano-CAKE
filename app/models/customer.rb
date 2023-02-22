class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :orders
  has_many :cart_items
  
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/} #,#message: 'はカタカナで入力して下さい。'
    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/} #,#message: 'はカタカナで入力して下さい。'
    validates :post_code, numericality: {only_integer: true} 
    validates :address
    validates :telephone_number, numericality: {only_integer: true}
    validates :email, uniqueness: true
    validates :encrypted_password
  end
  
  def full_name
    self.last_name + " " + self.first_name
  end
  
end
