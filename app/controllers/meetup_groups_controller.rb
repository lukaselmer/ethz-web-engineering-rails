class MeetupGroupsController < ApplicationController
  before_action :set_meetup_group, only: [:show, :edit, :update, :destroy]

  # GET /meetup_groups
  # GET /meetup_groups.json
  def index
    @meetup_groups = MeetupGroup.all
  end

  # GET /meetup_groups/1
  # GET /meetup_groups/1.json
  def show
  end

  # GET /meetup_groups/new
  def new
    @meetup_group = MeetupGroup.new
  end

  # GET /meetup_groups/1/edit
  def edit
  end

  # POST /meetup_groups
  # POST /meetup_groups.json
  def create
    @meetup_group = MeetupGroup.new(meetup_group_params)

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

  # PATCH/PUT /meetup_groups/1
  # PATCH/PUT /meetup_groups/1.json
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

  # DELETE /meetup_groups/1
  # DELETE /meetup_groups/1.json
  def destroy
    @meetup_group.destroy
    respond_to do |format|
      format.html { redirect_to meetup_groups_url, notice: 'Meetup group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup_group
      @meetup_group = MeetupGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetup_group_params
      params.require(:meetup_group).permit(:owner_id, :topic, :incepted_at, :home_town)
    end
end
