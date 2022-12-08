namespace :categories do
  desc "Seeds Categories"
  task seed_categories: :environment do
    Category.create!([
                       {
                         name: 0
                       },
                       {
                         name: 1
                       },
                       {
                         name: 2
                       },
                       {
                         name: 3
                       },
                       {
                         name: 4
                       },
                       {
                         name: 5
                       }
                     ])
    p "Created #{Category.count} categories"
  end

end
