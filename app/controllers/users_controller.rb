class UsersController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def save_twitter_auth
    a = request.env['omniauth.auth'].credentials
    current_user.update_twitter_auth(a.token, a.secret)
    redirect_to root_path, notice: 'Your twitter account has been linked successfully.'
  end
end
