namespace :products do
  desc "TODO"
  task seed_products: :environment do
    #[low_price high_price medium_price category all_products]
    Filter.create!([
                     {
                       name: 'low_price'
                     },
                     {
                       name: 'high_price'
                     },
                     {
                       name: 'medium_price'
                     },
                     {
                       name: 'category'
                     },
                     {
                       name: 'all_products'
                     },
                   ])
    Store.all.each do |store|
      store.products.create!([
                               {
                                 name: 'Handmade trousers',
                                 price: (250.6 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (10 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Handmade Socks',
                                 price: (2.5 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (30 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Handmade Coat',
                                 price: (600.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (5 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Handmade Sweater',
                                 price: (260.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (55 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }
                             ]).each_with_index do |prod, index|
        prod.categories << (Category.where(name: 'clothes') + Category.where(name: 'hand made'))
        images = Array.new
        (0..3).each { |number| images.push(File.open("public/images/handmade_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end

      store.products.create!([
                               {
                                 name: 'Hand maid Beach bag',
                                 price: (1000.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (5 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Hand Wallet',
                                 price: (280 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (20 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Hand maid Wristlet',
                                 price: (400.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (15 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Hand maid BackPack',
                                 price: (1600.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (35 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }
                             ]).each_with_index do |prod, index|
        prod.categories << (Category.where(name: 'bags') + Category.where(name: 'hand made'))
        images = Array.new
        (0..3).each { |number| images.push(File.open("public/images/handmade_bags_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end


      store.products.create!([
                               {
                                 name: 'Sneakers',
                                 price: (85.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (60 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Brown Oxford',
                                 price: (149.9 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (20 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Grey Slip-Ons',
                                 price: (50.0 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (50 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Light Brown Monk',
                                 price: (99.9 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (30 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }
                             ]).each_with_index do |prod, index|
        prod.categories << (Category.where(name: 'clothes') + Category.where(name: 'shoes'))
        images = Array.new
        (0..3).each { |number| images.push(File.open("public/images/shoes_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end

      store.products.create!([
                               {
                                 name: 'Hand maid Sandals',
                                 price: (250.6 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (15 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Hand maid Chukka',
                                 price: (559.9 * ((store.id + 250.0) / 250.0)),
                                 stock_quantity: (12 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }
                             ]).each_with_index do |prod, index|
        prod.categories << (Category.where(name: 'clothes') + Category.where(name: 'hand made') + Category.where(name: 'shoes'))
        images = Array.new
        (0..1).each { |number| images.push(File.open("public/images/hand_shoes_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end

      store.products.create!([
                               {
                                 name: 'ASUS ROG Crosshair VIII Dark Hero Motherboard',
                                 price: 449.0,
                                 stock_quantity: (30 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Ryzen 9 5900X CPU',
                                 price: 569.9,
                                 stock_quantity: (30 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'CORSAIR Vengeance DDR5 32GB RAM',
                                 price: 139.9,
                                 stock_quantity: (50 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Corsair RMX Series (2021), RM1000x, 1000 Watt, Gold, Fully Modular Power Supply',
                                 price: 189.9,
                                 stock_quantity: (15 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               },
                             ]).each_with_index do |prod, index|
        prod.categories << Category.where(name: 'pc parts')
        images = Array.new
        (0..3).each { |number| images.push(File.open("public/images/pc_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end

      store.products.create!([
                               {
                                 name: 'Ruby on Rails Tutorial',
                                 price: 49.9,
                                 stock_quantity: (10 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Agile Web Development with Rails 7',
                                 price: 59.95,
                                 stock_quantity: (30 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Practical Object-Oriented Design: An Agile Primer Using Ruby',
                                 price: 34.17,
                                 stock_quantity: (52 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               }, {
                                 name: 'Ruby on Rails Tutorial (Addison-Wesley Professional Ruby Series)',
                                 price: 49.99,
                                 stock_quantity: (55 + ((store.id + 20) / 20)),
                                 user_id: store.user_id
                               },
                             ]).each_with_index do |prod, index|
        prod.categories << Category.where(name: 'books')
        images = Array.new
        (0..3).each { |number| images.push(File.open("public/images/book_#{number}.jpg", 'rb')) }
        prod.image.attach(io: images[index], filename: prod.to_s + '_' + index.to_s)
        images.each { |image| image.close }
      end
    end
    p "Created #{Product.count} #{'product'.pluralize(Product.count)}"
  end

end
