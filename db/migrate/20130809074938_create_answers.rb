class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :catalog_id
      t.integer :user_id
      t.string :content
      t.string :file_name
      t.datetime :time

      t.timestamps
    end
  end
end
