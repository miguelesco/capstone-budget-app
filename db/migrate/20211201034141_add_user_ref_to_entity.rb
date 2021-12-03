class AddUserRefToEntity < ActiveRecord::Migration[6.1]
  def change
    add_reference :entities, :user, foreign_key: true
  end
end
