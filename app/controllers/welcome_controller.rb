class WelcomeController < ApplicationController
  def index
    @activities = Activity.by_user(current_user).upcoming.latest if signed_in?
  end

  def search_images
    f = FlickrService.new
    @images = f.search(params[:search_term])
  end
end
