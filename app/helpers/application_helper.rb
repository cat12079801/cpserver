module ApplicationHelper
  def current_user_name
    if current_user.nil?
      'ここから'
    else
      current_user.name
    end
  end

  def check_active c
    if c == controller.controller_name or (c == 'ranking' and controller.action_name == 'ranking') or (c == 'problems' and controller.controller_name == 'test_cases')
      return 'class=active'
    end
  end

  def status_tag s
    "<span class=\"badge #{s}\"></span>"
  end
end
