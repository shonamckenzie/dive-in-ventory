require_relative('../models/product')
require_relative('../models/manufacturer')

Product.delete_all
Manufacturer.delete_all

manufacturer1 = Manufacturer.new({ 'name' => 'scubapro', 'country' => 'usa', 'contact' => 'jeff', 'rating' => 5 })
manufacturer1.save()

manufacturer2 = Manufacturer.new({ 'name' => 'mares', 'country' => 'italy', 'contact' => 'lucio', 'rating' => 4 })
manufacturer3 = Manufacturer.new({ 'name' => 'suunto', 'country' => 'finland', 'contact' => 'elena', 'rating' => 5 })
manufacturer4 = Manufacturer.new({ 'name' => 'apeks', 'country' => 'uk', 'contact' => 'elke', 'rating' => 4 })

manufacturer2.save()
manufacturer3.save()
manufacturer4.save()

#
product1 = Product.new({ 'name' => 'mk25', 'description' => 'regulator', 'quantity' => 5, 'buy_cost' => 580.95, 'sell_price' => 675, 'manufacturer_id' => manufacturer1.id })
product2 = Product.new({ 'name' => 'xforce', 'description' => 'bcd', 'quantity' => 8, 'buy_cost' => 395.80, 'sell_price' => 450, 'manufacturer_id' => manufacturer1.id })
product3 = Product.new({ 'name' => 'apnea', 'description' => 'wetsuit', 'quantity' => 2, 'buy_cost' => 120.50, 'sell_price' => 180, 'manufacturer_id' => manufacturer2.id })
product4 = Product.new({ 'name' => 'avanti', 'description' => 'fins', 'quantity' => 1, 'buy_cost' => 70, 'sell_price' => 85, 'manufacturer_id' => manufacturer2.id })
product5 = Product.new({ 'name' => 'vyper', 'description' => 'computer', 'quantity' => 3, 'buy_cost' => 290, 'sell_price' => 320, 'manufacturer_id' => manufacturer3.id })
product6 = Product.new({ 'name' => 'd4', 'description' => 'computer', 'quantity' => 2, 'buy_cost' => 230, 'sell_price' => 265, 'manufacturer_id' => manufacturer3.id })
product7 = Product.new({ 'name' => 'xtx', 'description' => 'regulator', 'quantity' => 4, 'buy_cost' => 390, 'sell_price' => 450, 'manufacturer_id' => manufacturer4.id })
product8 = Product.new({ 'name' => 'rk3', 'description' => 'fins', 'quantity' => 2, 'buy_cost' => 70, 'sell_price' => 99.99, 'manufacturer_id' => manufacturer4.id })

product1.save()
product2.save()
product3.save()
product4.save()
product5.save()
product6.save()
product7.save()
product8.save()
