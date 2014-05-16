class WelcomeController < ApplicationController
  def index
    @activities = Activity.by_user(current_user).upcoming.latest if signed_in?
  end
end
