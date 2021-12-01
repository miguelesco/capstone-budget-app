class AddUserRole < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :role
    end
  end
end
