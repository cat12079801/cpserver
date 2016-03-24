class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
      redirect_to problems_path unless @problem.opened
    end
 
    def problem_params
      #params[:problem]
      params.require(:problem).permit(:title, :question, :flag, :point, :genre_id, :opened)
    end
end
