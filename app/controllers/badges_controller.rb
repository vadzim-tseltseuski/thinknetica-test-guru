class BadgesController < ApplicationController
  def user_badges
    @badges = current_user.badges
  end
end
