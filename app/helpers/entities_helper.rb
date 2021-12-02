module EntitiesHelper
  def entities_total(group)
    GroupEntity.where("group_id = #{group.id}").joins(:entity).sum('amount')
  end

  def entity_name(entity)
    Entity.find(entity.entity_id).name
  end

  def entity_created_at(entity)
    Entity.find(entity.entity_id).created_at.strftime('%d %b %Y')
  end

  def entity_amount(entity)
    Entity.find(entity.entity_id).amount
  end
end
