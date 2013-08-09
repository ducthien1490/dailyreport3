class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :content
      t.integer :group_id

      t.timestamps
    end
  end
end
