# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    result = GistQuestionService.new(question).call

    if result.success?
      url = result.url
      Gist.create(url: url, user: current_user, question: question)
      flash_options = { notice: t('.gist_created', url: clickable_url(url)) }
    else
      flash_options ={ alert: t('.gist_not_created') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def clickable_url(url)
    view_context.link_to('URL', url, target: '_blank')
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
