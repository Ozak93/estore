namespace :categories do
  desc "Seeds Categories"
  task seed_categories: :environment do
    %w[clothes shoes bags pc_parts books hand_made].each { |name| CategoryName.create!(name: name) }
    User.admin.first.categories.create!([
                       {
                         name: 'clothes'
                       },
                       {
                         name: 'shoes'
                       },
                       {
                         name: 'bags'
                       },
                       {
                         name: 'pc parts'
                       },
                       {
                         name: 'books'
                       },
                       {
                         name: 'hand made'
                       }
                     ])
    p "Created #{Category.count} #{'category'.pluralize(Category.count)}"
  end

end
