class SubmitController < ApplicationController
  def index
    @submits = Submit.where(user_id: current_user.id)
  end

  def show
    @submit = Submit.find(params[:id])
  end

  def create
  end
end
