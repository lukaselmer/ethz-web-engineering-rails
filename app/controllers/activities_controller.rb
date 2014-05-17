class ActivitiesController < ApplicationController
  load_and_authorize_resource except: [:new]

  def index
    @activities = Activity.upcoming.popular
    @archived_activities = Activity.archive
  end

  def show
  end

  def new
    @activity = Activity.new(create_params)
    authorize!(current_ability, @activity)
  end

  def edit
  end

  def create
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(update_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to @activity.meetup_group, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def update_params
    params.require(:activity).permit(:name, :location, :start_at, :duration, :description, :definite, :image_url, :image_link)
  end

  def create_params
    params.require(:activity).permit(:name, :location, :start_at, :duration, :description, :meetup_group_id, :definite)
  end
end
