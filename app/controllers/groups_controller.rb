class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_group, except: [ :index ]
  before_action :organization_admin!, except: [ :index, :show ]

  # GET /groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    if @group.save
      render json: @group, status: :created, location: @group
    else
      render_json_api_errors(@group)
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render_json_api_errors(@group)
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = action_name == 'create' ?
      Group.new(group_params) :
      Group.find(params[:id])
  end

  def organization_admin!
    unless @group.admin_users.include? current_user
      render status: :forbidden
    end
  end

  # Only allow a trusted parameter "white list" through.
  def group_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: group_valid_attributes)
  end

  def group_valid_attributes
    [
      :name, :emails,
      :organization
    ]
  end

end
