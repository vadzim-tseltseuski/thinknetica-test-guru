# frozen_string_literal: true

class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN user_tests on tests.id = user_tests.test_id')
        .where(user_tests: { user_id: id })
        .where(level: level)
  end
end
