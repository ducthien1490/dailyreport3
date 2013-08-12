class AddRequiredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :required, :boolean, default:false
  end
end
