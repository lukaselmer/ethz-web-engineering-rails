class VotesController < ApplicationController
  load_and_authorize_resource

  def show
    redirect_to root_path
  end

  def create
    @vote = Vote.new(vote_params)
    redirect_to @vote.activity, alert: 'You already voted!' and return if Vote.exists?(vote_params)
    redirect_to @vote.activity, alert: 'You are not part of the meetup group!' and return unless current_user.can_vote_for? @vote.activity

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote.activity, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to @vote.activity, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :activity_id)
  end
end
