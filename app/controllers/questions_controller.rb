class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<ol><% @test.questions.each do |p| %><li><%= p.body %></li><% end %></ol>"
  end

  def show
    render inline: "<%= @question.body %>"
  end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
        render inline: "<h1>Create question:</h1><p><%= @question.body%></p>"
    else
        render :new
    end
  end

  def destroy
    @question.destroy
    render render inline: "<h1>Question:'<%= @question.body%>' deleted</h1>"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question with ID: #{params[:id]}, was not found!"
  end

end
