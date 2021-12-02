class EntitiesController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @entities = Entity.all
    @user = current_user.id
  end

  def new
    @entity = Entity.new
    @group = Group.where(user_id: current_user.id)
    @user = current_user.id
  end

  def create
    @entity = Entity.new
    if params[:entity][:group_ids].nil?
      flash[:alert] = 'Please choose a category'
      redirect_to "/entities/new"
    else
      @entity.name = params[:entity][:name]
      @entity.amount = params[:entity][:amount]
      @entity.user_id = current_user.id

      binding.pry
      if @entity.save
        binding.pry
        params[:entity][:group_ids].each do |group_entity|
          @group_entity = GroupEntity.new
          @group_entity.entity_id = @entity.id
          @group_entity.group_id = group_entity
          @group_entity.save
        end

        redirect_to group_index_path
        flash[:alert] = 'Success!'

      else
        flash[:alert] = 'Error'
        render :new
      end

    end
  end

  private

  def group_params
    params.require(:group).permit(entity_ids: [])
  end
end
