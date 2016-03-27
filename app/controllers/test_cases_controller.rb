class TestCasesController < ApplicationController
  before_action :set_test_case, only: [:show, :edit, :update, :destroy]
  before_action :set_number_in_problem, only: [:show, :edit]
  before_action :sign_in_check
  before_action :check_administor

  def show
  end

  def new
    @test_case = TestCase.new(problem_id: params[:problem_id])
  end

  def edit
  end

  def create
    @test_case = TestCase.new(test_case_params)
    if @test_case.save
      redirect_to test_case_path(@test_case), notice: 'test_case was successfully created.'
    else
      render :new
    end
  end

  def update
    if @test_case.update(test_case_params)
      redirect_to test_case_path(@test_case), notice: 'test_case was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    problem = @test_case.problem
    @test_case.destroy
    redirect_to problem_path(problem), notice: 'test_case was successfully destroyed.'
  end

  private
    def set_test_case
      @test_case = TestCase.find(params[:id])
    end

    def set_number_in_problem
      TestCase.where(problem: @test_case.problem).each.with_index(1) do |test_case, i|
        @no = i if test_case == @test_case
      end
    end

    def test_case_params
      params.require(:test_case).permit(:problem_id, :input, :output)
    end
end
