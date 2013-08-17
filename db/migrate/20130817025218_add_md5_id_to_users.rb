class AddMd5IdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :md5_id, :string
  end
end
