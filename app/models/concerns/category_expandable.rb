module CategoryExpandable

  extend ActiveSupport::Concern
  included do
    if CategoryName.count == 0
      CATEGORIES = {}.freeze
    else
      CATEGORIES = {}
      CategoryName.all.select(:name).each_with_index { |cat_name, index| CATEGORIES[cat_name.name.to_sym] = index }
      CATEGORIES.freeze
    end

  end
end
