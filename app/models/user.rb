# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :owned_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    Test.joins('JOIN user_tests on tests.id = user_tests.test_id')
        .where(user_tests: { user_id: id })
        .where(level: level)
  end
end
