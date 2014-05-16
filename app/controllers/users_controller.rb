class UsersController < ApplicationController
  load_and_authorize_resource only: [:show, :index]

  def index
  end

  def show
  end
end
