class MeetupGroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @meetup_groups = MeetupGroup.all
  end

  def show
  end

  def new
    @meetup_group = MeetupGroup.new
  end

  def edit
  end

  def create
    @meetup_group = MeetupGroup.new(meetup_group_params)
    @meetup_group.owner = current_user

    respond_to do |format|
      if @meetup_group.save
        format.html { redirect_to @meetup_group, notice: 'Meetup group was successfully created.' }
        format.json { render :show, status: :created, location: @meetup_group }
      else
        format.html { render :new }
        format.json { render json: @meetup_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meetup_group.update(meetup_group_params)
        format.html { redirect_to @meetup_group, notice: 'Meetup group was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup_group }
      else
        format.html { render :edit }
        format.json { render json: @meetup_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meetup_group.destroy
    respond_to do |format|
      format.html { redirect_to meetup_groups_url, notice: 'Meetup group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def meetup_group_params
      params.require(:meetup_group).permit(:owner_id, :topic, :incepted_at, :home_town)
    end
end
