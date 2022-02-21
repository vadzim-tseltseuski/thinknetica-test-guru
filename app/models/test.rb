# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  class << self
    def titles_by_category_name(title)
      joins(:category)
        .where(categories: { title: title })
        .order(title: :desc)
        .pluck(:title)
    end
  end
end
