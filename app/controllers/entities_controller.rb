class EntitiesController < ApplicationController
  before_action :set_group

  def new
    @current_user = current_user
    @entity = Entity.new
    @groups = current_user.groups
  end

  
  def create
    @current_user = current_user
    @entity = Entity.new(name: params[:entity][:name], amount: params[:entity][:amount])
    @entity.user = @current_user
    @groups_id = params[:entity][:category_id]
    @groups_id.each do |category_id|
      group = Group.find(category_id)
      @entity.groups << group
    end
    if @entity.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, category_id: [])
  end
end