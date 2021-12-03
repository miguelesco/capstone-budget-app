module GroupHelper
  def category_total(group)
    GroupEntity.where("group_id = #{group.id}").joins(:entity).sum('amount')
  end
end
