class HomeController < ApplicationController
  before_action :sign_in_check, except: [:index]

  def index
  end

  def ranking
    users = {}
    User.all.each do |user|
      point = user.point
      if users[point].nil?
        users[point] = [user]
      else
        users[point] += [user]
      end
    end

    @users = []
    users.sort.reverse.each do |k, v|
      if v.length == 1
        @users += v
      else
        users2 = {}
        v.each do |u|
          last_submit = u.submits.where(status: "AC").last.created_at
          if users2[last_submit].nil?
            users2[last_submit] = [u]
          else
            users2[last_submit] += [u]
          end
        end
        users2.sort.each do |kk, vv|
          @users += vv
        end
      end
    end
  end
end
