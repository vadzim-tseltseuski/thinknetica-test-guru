# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
