# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# How to seed an attach_photo for Articles:

#   file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
#   article = Article.new(title: 'NES', body: "A great console")
#   article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


puts 'Cleaning database...'

Order.destroy_all
Membership.destroy_all
Type.destroy_all
 
puts 'Creating Categories...'

discounted = Type.create!(name: 'discounted')
fullprice = Type.create!(name: 'fullprice')

puts 'Creating Plans...'

student = Membership.create!(name: 'Student', type: discounted, description: 'Student membership plan', price: 1000)
regular = Membership.create!(name: 'Regular', type: fullprice, description: 'Regular membership plan', price: 2000)

puts 'Creating admins...'

admin1 = User.create!(email: 'admin1@admin.com', password: '123456', name: 'admin1', education: 'PhD', admin: 'true', confirmed_at: Time.now.utc)

admin1.save

admin2 = User.create!(email: 'admin2@admin.com', password: '123456', name: 'admin2', education: 'PhD', admin: 'true', confirmed_at: Time.now.utc)

admin2.save

puts 'Finished!'