namespace :stores do
  desc "TODO"
  task seed_stores: :environment do
    User.all.each do |user|
      user.stores.create!([

                            {
                              name: "#{user.name} #{user.id}'s First store"
                            },
                            {
                              name: "#{user.name} #{user.id}'s Second store"
                            },
                            {
                              name: "The Third store of #{user.name} #{user.id}"
                            },
                            {
                              name: "#{user.name} #{user.id}'s Store number Four"
                            },
                            {
                              name: "#{user.name} #{user.id}'s Last store"
                            },
                          ])
    end
    p "Created #{Store.count} #{'store'.pluralize(Store.count)}"
  end

end
