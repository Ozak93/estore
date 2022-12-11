class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.categories_expandable_with(extra_stages = {})
    include CategoryExpandable

    enum name: self::CATEGORIES.merge(extra_stages)
  end
end
