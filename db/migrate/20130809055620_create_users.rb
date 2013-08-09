class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :manager_group
      t.boolean :admin
      t.boolean :active
      t.integer :group_id

      t.timestamps

    end
      change_column :users, :manager_group ,default: => false 
      change_column :users, :admin ,default: => false 
      change_column :users, :active ,default: => false 
      change_column :users, :group_id ,default: => false 
  end
end
