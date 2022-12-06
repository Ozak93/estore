namespace :products do
  desc "TODO"
  task seed_products: :environment do
    Store.all.each do |store|
      store.products.create!([
                               {
                                 name: 'Hand maid trousers',
                                 price: (250.6 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (10 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand maid Socks',
                                 price: (2.5 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (30 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand maid Coat',
                                 price: (600.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (5 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand maid Sweater',
                                 price: (260.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (55 + ((store.id + 20) / 20))
                               }
                             ]).each{ |prod| prod.categories << (Category.clothes + Category.hand_made)}

      store.products.create!([
                               {
                                 name: 'Hand maid Beach bag',
                                 price: (1000.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (5 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand Wallet',
                                 price: (280 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (20 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand maid Wristlet',
                                 price: (400.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (15 + ((store.id + 20) / 20))
                               }, {
                                 name: 'Hand maid BackPack',
                                 price: (1600.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (35 + ((store.id + 20) / 20))
                               }
                             ]).each{|prod| prod.categories << (Category.bags + Category.hand_made)}

      store.products.create!([
                               {
                                 name: 'Sneakers',
                                 price: (85.0 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (60 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Brown Oxford',
                                 price: (149.9 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (20 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Grey Slip-Ons',
                                 price: (50.0 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (50 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Light Brown Monk',
                                 price: (99.9 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (30 + ((store.id + 20) / 20) )
                               }
                             ]).each{|prod| prod.categories << (Category.clothes + Category.shoes)}

      store.products.create!([
                               {
                                 name: 'Hand maid Sandals',
                                 price: (250.6 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (15 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Hand maid Chukka',
                                 price: (559.9 * ( (store.id + 250.0) / 250.0) ),
                                 stock_quantity: (12 + ((store.id + 20) / 20) )
                               }
                             ]).each{|prod| prod.categories << (Category.clothes + Category.hand_made + Category.shoes)}

      store.products.create!([
                               {
                                 name: 'ASUS ROG Crosshair VIII Dark Hero Motherboard',
                                 price: 449.0,
                                 stock_quantity: (30 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Ryzen 9 5900X CPU',
                                 price: 569.9,
                                 stock_quantity: (30 + ((store.id + 20) / 20) )
                               },{
                                 name: 'CORSAIR Vengeance DDR5 32GB RAM',
                                 price: 139.9,
                                 stock_quantity: (50 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Corsair RMX Series (2021), RM1000x, 1000 Watt, Gold, Fully Modular Power Supply',
                                 price: 189.9,
                                 stock_quantity: (15 + ((store.id + 20) / 20) )
                               },
                             ]).each{|prod| prod.categories << Category.pc_parts}

      store.products.create!([
                               {
                                 name: 'Ruby on Rails Tutorial',
                                 price: 49.9,
                                 stock_quantity: (10 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Agile Web Development with Rails 7',
                                 price: 59.95,
                                 stock_quantity: (30 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Practical Object-Oriented Design: An Agile Primer Using Ruby',
                                 price: 34.17,
                                 stock_quantity: (52 + ((store.id + 20) / 20) )
                               },{
                                 name: 'Ruby on Rails Tutorial (Addison-Wesley Professional Ruby Series)',
                                 price: 49.99,
                                 stock_quantity: (55 + ((store.id + 20) / 20) )
                               },
                             ]).each{|prod| prod.categories << Category.books}
    end
  end

end
