# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :only_correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :answer_limit

  def answer_limit
    errors.add(:question, "limit: from 1 to 4 answers") if question.answers.size >= 4
  end
end
