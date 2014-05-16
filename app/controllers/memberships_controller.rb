class MembershipsController < ApplicationController
  # "Bug / new feature required" in cancancan
  load_and_authorize_resource param_method: :membership_params, only: [:new, :create, :destroy]
  before_filter :set_available_users, only: [:new, :create]

  def new
  end

  def create
    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.meetup_group, notice: 'Membership was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to @membership.meetup_group, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_available_users
    @available_users = User.all.to_a - @membership.meetup_group.memberships.collect(&:user)
  end

  def membership_params
    params.require(:membership).permit(:meetup_group_id, :user_id)
  end
end
