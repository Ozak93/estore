module CategoryExpandable

  extend ActiveSupport::Concern
  included do
    CATEGORIES = {}.freeze
  end

end
