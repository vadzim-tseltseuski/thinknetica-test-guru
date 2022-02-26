class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    render inline: "<ol><% @test.questions.each do |p| %><li><%= p.body %></li><% end %></ol>"
  end

  def show
    render inline: "<%= @question.body %>"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

end
