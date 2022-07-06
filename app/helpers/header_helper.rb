# frozen_string_literal: true

module HeaderHelper
  def question_header(question)
    question.new_record? ? t('.edit_header', title: question.test.title) : t('.new_header', title: question.test.title)
  end
end
