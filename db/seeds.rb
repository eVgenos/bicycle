# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usage.delete_all
Suggestion.delete_all
Bicycle.delete_all
Category.delete_all
User.delete_all
Image.delete_all

User.create!(email: 'pierre@michaux.com', password: 'progenitor')
User.create!(email: 'evgenos@example.com', password: '123456')

['Electric Bicycles', 'Road Bikes', 'Mountain Bikes', 'Kids bikes', 'Beach Cruiser Bikes'].each do |category|
  Category.create!(name: category)
end

['Cargo-Electric Bicycle', 'Electric Bike',
 'Cyclocross Disc Bike', 'Sport Disc Road Bike', 'Carbon Fork',
 'Polygon Xtrada 6.0', 'Polygon Trid Dirt Jump', 'Polygon Entiat TR8', 'BOA Trail 29er',
 'Polygon Cozmic RX3.0',
 'Polygon Relic 24', 'Polygon Sierra AX', 'Rudge BMX Bike',
 'Sierra Deluxe Sport', 'Polygon Town 3 Beach',
 'Sierra Oosten - 8'].each do |bicycle_name|
  Bicycle.create!(name: bicycle_name,
                  category_id: rand(Category.first.id..Category.last.id), user_id: rand(User.first.id..User.last.id),
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis porttitor nisi, at hendrerit nunc. Nulla urna sapien, venenatis quis lectus non, convallis varius orci. Vestibulum condimentum erat vel neque mattis, non consectetur lorem lacinia. Proin semper lorem eget neque rhoncus, laoreet luctus urna fermentum. Proin finibus quam ut viverra euismod. In nisi erat, interdum et felis quis, dictum molestie lacus. Donec at ante at magna condimentum facilisis. Duis pulvinar nisl condimentum suscipit iaculis. In at elementum arcu.')
end


Bicycle.all.each do |bicycle|
  Image.create!(imageable_type: "Bicycle", imageable_id: bicycle.id, file: Rails.root.join("app/assets/images/seed/#{rand(1..10)}.jpg").open)
end