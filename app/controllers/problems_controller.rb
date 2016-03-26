class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  before_action :check_administor, except: [:index, :show]

  def index
    if current_user.administor
      @problems = Problem.all
    else
      @problems = Problem.where(opened: true)
    end
  end

  def show
    @submit = Submit.new
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problem_path(@problem), notice: 'Problem was successfully created.'
    else
      render :new
    end
  end

  def update
    if @problem.update(problem_params)
      redirect_to problem_path(@problem), notice: 'Problem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_url, notice: 'Problem was successfully destroyed.'
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
      redirect_to problems_path, notice: '(´・ω・`)' unless current_user.administor or @problem.opened
    end

    def problem_params
      params.require(:problem).permit(:name, :question, :point, :opened)
    end

    def check_administor
      redirect_to problems_path, notice: '(´・ω・`)' if current_user.administor.!
    end
end