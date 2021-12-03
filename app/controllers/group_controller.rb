class GroupController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @user = current_user.id
  end

  def new
    @group = Group.new
    @user = current_user.id
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to group_index_path
      flash[:alert] = 'Success!'
    else
      flash[:alert] = 'Error'
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(group_ids: [])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
