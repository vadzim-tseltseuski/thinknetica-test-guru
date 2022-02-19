# frozen_string_literal: true

class Test < ApplicationRecord
  class << self
    def titles_by_category_name(title)
      joins('JOIN categories on tests.category_id = categories.id')
          .where(categories: { title: title })
          .order(title: :desc)
          .pluck(:title)
    end
  end
end
