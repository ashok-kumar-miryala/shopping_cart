# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name:  'Jhon Adam',
             email: 'jhonadam@gmail.com',
             password:              'foobar',
             password_confirmation: 'foobar',
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

7.times do |n|
  name  = Faker::Name.name
  email = "seth-#{n + 1}@gmail.com"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

  users = User.order(:created_at).take(6)

end

cart1 = Cart.create(user_id: 1)
cart2 = Cart.create(user_id: 1)
cart3 = Cart.create(user_id: 2)
cart4 = Cart.create(user_id: 2)
cart5 = Cart.create(user_id: 3)
cart6 = Cart.create(user_id: 4)
cart7 = Cart.create(user_id: 5)
cart8 = Cart.create(user_id: 5)



product1 = Product.create({:name=>"Watch", :price => 1})
product2 = Product.create({:name=>"Fitbit", :price => 3})
product3 = Product.create({:name=>"Noise", :price => 5.50})
product4 = Product.create({:name=>"Titan", :price => 10})
product5 = Product.create({:name=>"SAMSUNG", :price => 3.20})
product6 = Product.create({:name=>"ROBE", :price => 15.20})
product7 = Product.create({:name=>"GRAPHITE", :price => 15.20})
product8 = Product.create({:name=>"MRF", :price => 15.20})
product9 = Product.create({:name=>"ODENANAT", :price => 15.20})
product10 = Product.create({:name=>"ZAKRITH", :price => 15.20})

puts "Total number of products: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("name")}"
puts "Product1: #{product1.name} price: #{product1.price.round(2)}"
puts "Product2: #{product2.name} price: #{product2.price.round(2)}"
puts "Product3: #{product3.name} price: #{product3.price.round(2)}"
puts "Product4: #{product4.name} price: #{product4.price.round(2)}"
puts "Product5: #{product5.name} price: #{product5.price.round(2)}"
puts "Product6: #{product6.name} price: #{product6.price.round(2)}"

order1 = Order.create({:description=>"tomato", :user_id => 1, :pay_method=>"Rupees"})
order2 = Order.create({:description=>"milk", :user_id => 2, :pay_method=>"Rupees"})
order3 = Order.create({:description=>"bread", :user_id => 2, :pay_method=>"Rupees"})
order4 = Order.create({:description=>"bacon", :user_id => 1, :pay_method=>"Rupees"})
order5 = Order.create({:description=>"cheese", :user_id => 3, :pay_method=>"Rupees"})
order6 = Order.create({:description=>"molohia", :user_id => 1, :pay_method=>"Rupees"})
order7 = Order.create({:description=>"molohia", :user_id => 1, :pay_method=>"Rupees"})
order8 = Order.create({:description=>"molohia", :user_id => 1, :pay_method=>"Rupees"})
order9 = Order.create({:description=>"molohia", :user_id => 1, :pay_method=>"Rupees"})

item = Item.create(order_id: order1.id, product_id: product1.id, cart_id: cart1.id, quantity: "small")
item = Item.create(order_id: order2.id, product_id: product1.id, cart_id: cart1.id, quantity: "small")
item = Item.create(order_id: order3.id, product_id: product2.id, cart_id: cart2.id, quantity: "small")
item = Item.create(order_id: order4.id, product_id: product2.id, cart_id: cart2.id, quantity: "small")
item = Item.create(order_id: order5.id, product_id: product3.id, cart_id: cart3.id, quantity: "small")
item = Item.create(order_id: order6.id, product_id: product4.id, cart_id: cart4.id, quantity: "small")
item = Item.create(order_id: order7.id, product_id: product5.id, cart_id: cart5.id, quantity: "small")
item = Item.create(order_id: order8.id, product_id: product5.id, cart_id: cart6.id, quantity: "small")
item = Item.create(order_id: order5.id, product_id: product6.id, cart_id: cart7.id, quantity: "small")