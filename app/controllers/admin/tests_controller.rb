# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update update_inline destroy]

  def index; end

  def new
    @test = Test.new
  end

  def edit; end

  def show
    @questions = @test.questions
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path
    else
      render :show
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.owned_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests ||= Test.all
  end
end
