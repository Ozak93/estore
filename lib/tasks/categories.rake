namespace :categories do
  desc "Seeds Categories"
  task seed_categories: :environment do
    %w[clothes shoes bags pc_parts books hand_made].each { |name| CategoryName.create!(name: name) }
    User.admin.first.categories.create!([
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
    p "Created #{Category.count} #{'category'.pluralize(Category.count)}"
  end

end
