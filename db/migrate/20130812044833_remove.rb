class Remove < ActiveRecord::Migration
  def change
  	remove_column :users, :required 
  end
end
