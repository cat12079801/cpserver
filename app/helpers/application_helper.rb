module ApplicationHelper
  def current_user_name
    if current_user.nil?
      'ここから'
    else
      current_user.name
    end
  end
end
