# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :answer_limit


  def answer_limit
    errors.add(:question, "limit: from 1 to 4 answers") if answers.size >= 4
  end
end
