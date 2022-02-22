# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answer_limit, on: :create

  scope :correct, -> { where(correct: true) }

  def answer_limit
    errors.add(:question, 'limit: from 1 to 4 answers') if question.answers.count >= 4
  end
end
