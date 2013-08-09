class AddManagerGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manager_group, :boolean, default: false
  end
end
