class SubmitController < ApplicationController
  before_action :sign_in_check

  def index
    @submits = Submit.where(user_id: current_user.id)
  end

  def show
    @submit = Submit.find(params[:id])
    redirect_to submit_index_path, notice: '(´・ω・`)' if @submit.user != current_user
  end

  def create
    @submit = Submit.new(submit_params)
    @submit.user = current_user
    if @submit.save
      JudgeJob.perform_later(@submit)
      redirect_to submit_path(@submit), notice: 'submit was successfully created.'
    else
      render :new
    end
  end

  private
    def submit_params
      params.require(:submit).permit(:code, :language_id, :problem_id)
    end
end
