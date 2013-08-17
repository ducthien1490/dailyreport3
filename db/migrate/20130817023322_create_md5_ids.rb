class CreateMd5Ids < ActiveRecord::Migration
  def change
    create_table :md5_ids do |t|
      t.string :md5
      t.integer :user_id

      t.timestamps
    end
  end
end
