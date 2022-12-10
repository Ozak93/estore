namespace :users do
  desc "TODO"
  task seed_users: :environment do
    User.create!([
                   {
                      email: 'admin@admin.com',
                      name: 'Admin Huthaifa Taya',
                      password: 'admin123',
                      role: 2
                   },
                   {
                      email: 'owner@owner.com',
                      name: 'Owner Huthaifa Taya',
                      password: 'admin123',
                      role: 1
                   },
                   {
                      email: 'owner1@owner.com',
                      name: 'Owner Huthaifa Taya',
                      password: 'admin123',
                      role: 1
                   },
                   {
                      email: 'customer@customer.com',
                      name: 'Customer Huthaifa Taya',
                      password: 'admin123',
                      role: 0
                   },
                   {
                      email: 'customer1@customer.com',
                      name: 'Customer Huthaifa Taya',
                      password: 'admin123',
                      role: 0
                   },
                 ])

    p "created #{User.count} #{ 'user'.pluralize(User.count) }"
  end

end
