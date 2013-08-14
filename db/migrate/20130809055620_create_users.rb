class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :manager_group
      t.boolean :admin
      t.boolean :active
      t.integer :group_id
      
      

    end
      change_column :users, :manager_group,:boolean ,:default => false 
      change_column :users, :admin ,:boolean, :default => false 
      change_column :users, :active ,:boolean, :default => false 
      change_column :users, :group_id,:integer, :default => 0
    end
end
