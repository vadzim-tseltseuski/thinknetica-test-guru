# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  belongs_to :category
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  class << self
    def titles_by_category_name(title)
      joins('JOIN categories on tests.category_id = categories.id')
        .where(categories: { title: title })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
