class MembershipsController < ApplicationController
  # TODO: authorization
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  def index
    @memberships = Membership.all
  end

  def show
  end

  def new
    @membership = Membership.new(membership_params)
    set_available_users
  end

  def create
    @membership = Membership.new(membership_params)
    set_available_users

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
      format.html { redirect_to memberships_url, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_membership
    @membership = Membership.find(params[:id])
  end

  def set_available_users
    @available_users = User.all.to_a - @membership.meetup_group.memberships.collect(&:user)
  end

  def membership_params
    params.require(:membership).permit(:meetup_group_id, :user_id)
  end
end
