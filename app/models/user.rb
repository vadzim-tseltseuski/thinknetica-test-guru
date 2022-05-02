# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :owned_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
