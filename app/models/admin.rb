class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attribute :email, :string, default: ENV['EMAIL']
  attribute :encrypted_password, :string, default: ENV['PASSWORD']
         
end
