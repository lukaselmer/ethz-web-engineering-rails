class VotesController < ApplicationController
  # TODO: authorization
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    redirect_to @vote.activity, alert: 'You already voted!' and return if Vote.exists?(vote_params)

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
  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:user_id, :activity_id)
  end
end
