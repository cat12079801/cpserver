class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in_check
    redirect_to root_path, notice: 'ログインして！' unless user_signed_in?
  end

  def check_administor
    redirect_to problems_path, notice: '(´・ω・`)' if current_user.administor.!
  end
end
