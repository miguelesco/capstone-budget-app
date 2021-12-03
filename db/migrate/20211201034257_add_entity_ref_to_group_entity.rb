class AddEntityRefToGroupEntity < ActiveRecord::Migration[6.1]
  def change
    add_reference :group_entities, :entity, foreign_key: true
  end
end
