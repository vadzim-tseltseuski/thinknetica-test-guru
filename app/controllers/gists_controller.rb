class GistsController < ApplicationController
    def create
      @test_passage = TestPassage.find(params[:test_passage_id])
      question = @test_passage.current_question
      result = GistQuestionService.new(question).call

      if result.success?
        url = result.url
        Gist.create(url: url, user: current_user, question: question)
        flash_options = { notice: t('.gist_created', url: clickable_url(url)) }
      else
        flash_options = { alert: t('.gist_not_created') }
      end

      redirect_to @test_passage, flash_options
    end


    private

    def clickable_url(url)
      view_context.link_to('URL', url, target: '_blank')
    end
  end