class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    render inline: "<ol><% @test.questions.each do |p| %><li><%= p.body %></li><% end %></ol>"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

end
