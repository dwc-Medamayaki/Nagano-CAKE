# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
   email: 'test@test.com',
   encrypted_password: "inuninja",
   last_name: '手素戸',
   first_name: '太郎',
   last_name_kana: 'テスト',
   first_name_kana: 'タロウ',
   post_code: '1234567',
   address: '日本',
   telephone_number: '1234567890',
   is_deleted: false
)