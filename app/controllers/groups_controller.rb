class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @current_user = current_user
    @group = Group.new
  end

  def create
    @current_user = current_user
    @group = Group.new(group_params)
    @group.user = @current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(request.params['id'])
    @current_user = current_user
    @entities = Entity.joins(:entities_groups).where(entities_groups: { group_id: @group.id },
                                                     user_id: @current_user.id).order(created_at: :desc)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
