class AddRequiredToCatalogs < ActiveRecord::Migration
  def change
    add_column :catalogs, :required, :boolean , default: false
  end
end
