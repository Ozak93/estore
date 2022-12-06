namespace :stores do
  desc "TODO"
  task seed_stores: :environment do
    Store.create!([
                    {
                      name: 'huthaifa\'s First store'
                    },
                    {
                      name: 'My Second store'
                    },
                    {
                      name: 'The Third store'
                    },
                    {
                      name: 'Store number Four'
                    },
                    {
                      name: 'Last store'
                    },
                  ])
  end

end
