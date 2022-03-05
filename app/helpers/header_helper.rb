# frozen_string_literal: true

module HeaderHelper
  def question_header(question)
    "#{question.new_record? ? 'Create New' : 'Edit'} #{question.test.title} Question"
  end
end
